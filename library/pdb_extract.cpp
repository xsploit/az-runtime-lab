// Legacy Rekordbox export.pdb -> JSON intermediate record set.
//
// Reuses BiteDJ's generated Kaitai parser (rekordbox_pdb.{h,cpp}) and the
// kaitai C++ runtime -- no Qt, no BiteDJ Track/Sql types. The table walk and
// getText() logic mirror rekordboxfeature.cpp::parseDeviceDB so the same
// records BiteDJ imports are captured for the AZ OneLibrary writer.
//
// Output is a stable JSON document: tracks (with original ids and resolved
// artist/album/genre/key names + relative media/analysis paths), the playlist
// tree (parent/sort_order/is_folder), and ordered playlist entries. This is
// input-side evidence only; it does not itself produce a OneLibrary database.
//
// Build: see library/build_pdb_extract.sh. Paths are arguments, not baked in.

#include <rekordbox_pdb.h>
#include <kaitai/kaitaistream.h>

#include <cstdint>
#include <fstream>
#include <iostream>
#include <map>
#include <set>
#include <sstream>
#include <string>
#include <vector>

namespace {

// UTF-16LE (device long strings) -> UTF-8, minimal and dependency-free.
std::string utf16le_to_utf8(const std::string& in) {
    std::string out;
    for (size_t i = 0; i + 1 < in.size(); i += 2) {
        uint32_t cp = static_cast<uint8_t>(in[i]) |
                (static_cast<uint8_t>(in[i + 1]) << 8);
        if (cp >= 0xD800 && cp <= 0xDBFF && i + 3 < in.size()) {
            uint32_t lo = static_cast<uint8_t>(in[i + 2]) |
                    (static_cast<uint8_t>(in[i + 3]) << 8);
            if (lo >= 0xDC00 && lo <= 0xDFFF) {
                cp = 0x10000 + ((cp - 0xD800) << 10) + (lo - 0xDC00);
                i += 2;
            }
        }
        if (cp == 0) continue;
        if (cp < 0x80) {
            out += static_cast<char>(cp);
        } else if (cp < 0x800) {
            out += static_cast<char>(0xC0 | (cp >> 6));
            out += static_cast<char>(0x80 | (cp & 0x3F));
        } else if (cp < 0x10000) {
            out += static_cast<char>(0xE0 | (cp >> 12));
            out += static_cast<char>(0x80 | ((cp >> 6) & 0x3F));
            out += static_cast<char>(0x80 | (cp & 0x3F));
        } else {
            out += static_cast<char>(0xF0 | (cp >> 18));
            out += static_cast<char>(0x80 | ((cp >> 12) & 0x3F));
            out += static_cast<char>(0x80 | ((cp >> 6) & 0x3F));
            out += static_cast<char>(0x80 | (cp & 0x3F));
        }
    }
    return out;
}

// Mirrors rekordboxfeature.cpp::getText: the PDB stores strings in several
// obscure encodings behind device_sql_string_t; drop embedded null bytes.
std::string get_text(rekordbox_pdb_t::device_sql_string_t* s) {
    if (!s) return {};
    std::string text;
    kaitai::kstruct* body = s->body();
    if (auto* a = dynamic_cast<rekordbox_pdb_t::device_sql_short_ascii_t*>(body)) {
        text = a->text();
    } else if (auto* a = dynamic_cast<rekordbox_pdb_t::device_sql_long_ascii_t*>(body)) {
        text = a->text();
    } else if (auto* u = dynamic_cast<rekordbox_pdb_t::device_sql_long_utf16le_t*>(body)) {
        text = utf16le_to_utf8(u->text());
    }
    std::string cleaned;
    for (char c : text) {
        if (c != '\x00') cleaned += c;
    }
    return cleaned;
}

std::string json_escape(const std::string& in) {
    std::string out;
    for (unsigned char c : in) {
        switch (c) {
        case '"': out += "\\\""; break;
        case '\\': out += "\\\\"; break;
        case '\n': out += "\\n"; break;
        case '\r': out += "\\r"; break;
        case '\t': out += "\\t"; break;
        default:
            if (c < 0x20) {
                char buf[8];
                std::snprintf(buf, sizeof(buf), "\\u%04x", c);
                out += buf;
            } else {
                out += static_cast<char>(c);
            }
        }
    }
    return out;
}

struct Track {
    uint32_t id, artist_id, album_id, genre_id, key_id, tempo, bitrate, track_number;
    uint16_t year, duration;
    uint8_t rating, color_id;
    std::string title, comment, file_path, analyze_path;
};

struct PlaylistNode {
    uint32_t id, parent_id, sort_order;
    bool is_folder;
    std::string name;
};

struct Entry {
    uint32_t playlist_id, entry_index, track_id;
};

} // namespace

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cerr << "usage: pdb_extract <export.pdb> [--out FILE]\n";
        return 2;
    }
    std::string pdb_path = argv[1];
    std::string out_path;
    for (int i = 2; i < argc; ++i) {
        std::string a = argv[i];
        if (a == "--out" && i + 1 < argc) out_path = argv[++i];
    }

    std::ifstream ifs(pdb_path, std::ifstream::binary);
    if (!ifs) {
        std::cerr << "cannot open " << pdb_path << "\n";
        return 1;
    }
    kaitai::kstream ks(&ifs);
    rekordbox_pdb_t db(&ks);

    std::map<uint32_t, std::string> artists, albums, genres, keys;
    std::vector<Track> tracks;
    std::vector<PlaylistNode> nodes;
    std::vector<Entry> entries;
    std::set<uint32_t> visited_pages;

    for (const auto& table : *db.tables()) {
        const uint32_t last = table->last_page()->index();
        rekordbox_pdb_t::page_ref_t* ref = table->first_page();
        while (true) {
            // Bounded traversal: never revisit a page (guards cyclic chains).
            if (!visited_pages.insert(ref->index()).second) break;
            rekordbox_pdb_t::page_t* page = ref->body();
            if (page->is_data_page()) {
                for (const auto& rg : *page->row_groups()) {
                    for (const auto& rr : *rg->rows()) {
                        if (!rr->present()) continue;
                        switch (table->type()) {
                        case rekordbox_pdb_t::PAGE_TYPE_ARTISTS: {
                            auto* r = static_cast<rekordbox_pdb_t::artist_row_t*>(rr->body());
                            artists[r->id()] = get_text(r->name());
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_ALBUMS: {
                            auto* r = static_cast<rekordbox_pdb_t::album_row_t*>(rr->body());
                            albums[r->id()] = get_text(r->name());
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_GENRES: {
                            auto* r = static_cast<rekordbox_pdb_t::genre_row_t*>(rr->body());
                            genres[r->id()] = get_text(r->name());
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_KEYS: {
                            auto* r = static_cast<rekordbox_pdb_t::key_row_t*>(rr->body());
                            keys[r->id()] = get_text(r->name());
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_TRACKS: {
                            auto* r = static_cast<rekordbox_pdb_t::track_row_t*>(rr->body());
                            tracks.push_back({r->id(), r->artist_id(), r->album_id(),
                                    r->genre_id(), r->key_id(), r->tempo(), r->bitrate(),
                                    r->track_number(), r->year(), r->duration(), r->rating(),
                                    r->color_id(), get_text(r->title()), get_text(r->comment()),
                                    get_text(r->file_path()), get_text(r->analyze_path())});
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_PLAYLIST_TREE: {
                            auto* r = static_cast<rekordbox_pdb_t::playlist_tree_row_t*>(rr->body());
                            nodes.push_back({r->id(), r->parent_id(), r->sort_order(),
                                    r->is_folder(), get_text(r->name())});
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_PLAYLIST_ENTRIES: {
                            auto* r = static_cast<rekordbox_pdb_t::playlist_entry_row_t*>(rr->body());
                            entries.push_back({r->playlist_id(), r->entry_index(), r->track_id()});
                        } break;
                        default:
                            break;
                        }
                    }
                }
            }
            if (ref->index() == last) break;
            ref = page->next_page();
        }
    }

    std::ostringstream o;
    o << "{\n \"source_pdb\": \"" << json_escape(pdb_path) << "\",\n";
    o << " \"counts\": {\"tracks\": " << tracks.size() << ", \"playlists\": "
      << nodes.size() << ", \"entries\": " << entries.size() << ", \"artists\": "
      << artists.size() << ", \"albums\": " << albums.size() << ", \"genres\": "
      << genres.size() << ", \"keys\": " << keys.size() << "},\n";

    o << " \"tracks\": [\n";
    for (size_t i = 0; i < tracks.size(); ++i) {
        const Track& t = tracks[i];
        o << "  {\"id\": " << t.id << ", \"title\": \"" << json_escape(t.title)
          << "\", \"artist\": \"" << json_escape(artists.count(t.artist_id) ? artists[t.artist_id] : "")
          << "\", \"album\": \"" << json_escape(albums.count(t.album_id) ? albums[t.album_id] : "")
          << "\", \"genre\": \"" << json_escape(genres.count(t.genre_id) ? genres[t.genre_id] : "")
          << "\", \"key\": \"" << json_escape(keys.count(t.key_id) ? keys[t.key_id] : "")
          << "\", \"bpm\": " << (t.tempo / 100.0)
          << ", \"bitrate\": " << t.bitrate << ", \"duration_sec\": " << t.duration
          << ", \"year\": " << t.year << ", \"track_number\": " << t.track_number
          << ", \"rating\": " << static_cast<int>(t.rating)
          << ", \"color_id\": " << static_cast<int>(t.color_id)
          << ", \"comment\": \"" << json_escape(t.comment)
          << "\", \"file_path\": \"" << json_escape(t.file_path)
          << "\", \"analyze_path\": \"" << json_escape(t.analyze_path) << "\"}";
        o << (i + 1 < tracks.size() ? ",\n" : "\n");
    }
    o << " ],\n";

    o << " \"playlists\": [\n";
    for (size_t i = 0; i < nodes.size(); ++i) {
        const PlaylistNode& n = nodes[i];
        o << "  {\"id\": " << n.id << ", \"parent_id\": " << n.parent_id
          << ", \"sort_order\": " << n.sort_order << ", \"is_folder\": "
          << (n.is_folder ? "true" : "false") << ", \"name\": \""
          << json_escape(n.name) << "\"}";
        o << (i + 1 < nodes.size() ? ",\n" : "\n");
    }
    o << " ],\n";

    o << " \"playlist_entries\": [\n";
    for (size_t i = 0; i < entries.size(); ++i) {
        const Entry& e = entries[i];
        o << "  {\"playlist_id\": " << e.playlist_id << ", \"entry_index\": "
          << e.entry_index << ", \"track_id\": " << e.track_id << "}";
        o << (i + 1 < entries.size() ? ",\n" : "\n");
    }
    o << " ]\n}\n";

    if (out_path.empty()) {
        std::cout << o.str();
    } else {
        std::ofstream ofs(out_path);
        ofs << o.str();
        std::cerr << "wrote " << out_path << " (" << tracks.size() << " tracks, "
                  << nodes.size() << " playlists, " << entries.size() << " entries)\n";
    }
    return 0;
}
