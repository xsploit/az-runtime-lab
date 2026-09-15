// Legacy Rekordbox export.pdb -> JSON intermediate record set.
//
// Reuses BiteDJ's generated Kaitai parser (rekordbox_pdb.{h,cpp}) and the
// kaitai C++ runtime -- no Qt, no BiteDJ Track/Sql types. The table walk and
// getText() logic mirror rekordboxfeature.cpp::parseDeviceDB so the same
// records BiteDJ imports are captured for the AZ adaptation work.
//
// Output is a stable JSON document: tracks (with original ids and resolved
// artist/album/genre/key names + relative media/analysis paths), the playlist
// tree (parent/sort_order/is_folder), and ordered playlist entries. This is
// input-side extraction only; it performs no format conversion.
//
// Build: see library/build_pdb_extract.sh. Paths are arguments, not baked in.

#include <rekordbox_pdb.h>
#include <kaitai/kaitaistream.h>

#include "device_text.h"

#include <cstdint>
#include <memory>
#include <fstream>
#include <iostream>
#include <map>
#include <set>
#include <sstream>
#include <string>
#include <vector>

namespace {

using device_text::json_escape;
using device_text::utf16_to_utf8;

// Device strings are known to carry stray null characters mid-field.
std::string strip_nulls(const std::string& in) {
    std::string out;
    for (char c : in) {
        if (c != '\x00') out += c;
    }
    return out;
}

// Mirrors rekordboxfeature.cpp::getText: the PDB stores strings in several
// obscure encodings behind device_sql_string_t; drop embedded null bytes.
std::string get_text(rekordbox_pdb_t::device_sql_string_t* s) {
    if (!s) return {};
    kaitai::kstruct* body = s->body();
    if (auto* a = dynamic_cast<rekordbox_pdb_t::device_sql_short_ascii_t*>(body)) {
        return strip_nulls(a->text());
    }
    if (auto* a = dynamic_cast<rekordbox_pdb_t::device_sql_long_ascii_t*>(body)) {
        return strip_nulls(a->text());
    }
    if (auto* u = dynamic_cast<rekordbox_pdb_t::device_sql_long_utf16le_t*>(body)) {
        return utf16_to_utf8(u->text(), /*big_endian=*/false);
    }
    return {};
}

struct Track {
    uint32_t id, artist_id, album_id, genre_id, key_id, tempo, bitrate, track_number;
    uint32_t label_id, artwork_id;
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

// The bundled .ksy describes export.pdb. exportExt.pdb reuses the same page
// and table framing but its rows have different layouts, so feeding it to this
// schema reads nonsense lengths: measured on a real export that aborts the
// process (std::length_error from a bogus vector size) rather than failing
// cleanly. A malformed or foreign file must be rejected up front, and any row
// that still misparses must not take the whole walk down with it.
constexpr uint32_t kMinExportTables = 16;

struct Validation {
    bool ok = false;
    std::string error;
};

Validation validate_header(const rekordbox_pdb_t& db, uint64_t file_size) {
    Validation v;
    const uint32_t page = db.len_page();
    const uint32_t tables = db.num_tables();
    if (page < 512 || page > 65536 || (page & (page - 1)) != 0) {
        v.error = "implausible page size " + std::to_string(page) +
                "; this does not look like a rekordbox PDB";
        return v;
    }
    if (tables == 0 || tables > 64) {
        v.error = "implausible table count " + std::to_string(tables) +
                "; this does not look like a rekordbox PDB";
        return v;
    }
    if (file_size < static_cast<uint64_t>(page) * 2) {
        v.error = "file is smaller than two pages; truncated or not a PDB";
        return v;
    }
    if (tables < kMinExportTables) {
        v.error = "only " + std::to_string(tables) +
                " tables: this looks like exportExt.pdb or another PDB variant. "
                "The bundled schema describes export.pdb only; parsing other "
                "variants with it yields garbage or crashes.";
        return v;
    }
    v.ok = true;
    return v;
}

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
    ifs.seekg(0, std::ios::end);
    const uint64_t file_size = static_cast<uint64_t>(ifs.tellg());
    ifs.seekg(0);

    kaitai::kstream ks(&ifs);
    std::unique_ptr<rekordbox_pdb_t> db_holder;
    try {
        db_holder = std::make_unique<rekordbox_pdb_t>(&ks);
    } catch (const std::exception& e) {
        std::cerr << "cannot parse " << pdb_path << " as a rekordbox PDB: "
                  << e.what() << "\n";
        return 1;
    }
    rekordbox_pdb_t& db = *db_holder;

    const Validation valid = validate_header(db, file_size);
    if (!valid.ok) {
        std::cerr << "refusing " << pdb_path << ": " << valid.error << "\n";
        return 1;
    }

    std::map<uint32_t, std::string> artists, albums, genres, keys, labels, artwork;
    // Track colours are an id into the COLORS table; the names live there, so
    // a colour can be preserved by name instead of a bare numeric id.
    std::map<uint32_t, std::string> colors;
    std::vector<Track> tracks;
    std::vector<PlaylistNode> nodes;
    std::vector<Entry> entries;
    std::set<uint32_t> visited_pages;

    size_t row_errors = 0, page_errors = 0;
    for (const auto& table : *db.tables()) {
      try {
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
                        try {
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
                        case rekordbox_pdb_t::PAGE_TYPE_LABELS: {
                            auto* r = static_cast<rekordbox_pdb_t::label_row_t*>(rr->body());
                            labels[r->id()] = get_text(r->name());
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_COLORS: {
                            auto* r = static_cast<rekordbox_pdb_t::color_row_t*>(rr->body());
                            colors[r->id()] = get_text(r->name());
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_ARTWORK: {
                            auto* r = static_cast<rekordbox_pdb_t::artwork_row_t*>(rr->body());
                            artwork[r->id()] = get_text(r->path());
                        } break;
                        case rekordbox_pdb_t::PAGE_TYPE_TRACKS: {
                            auto* r = static_cast<rekordbox_pdb_t::track_row_t*>(rr->body());
                            tracks.push_back({r->id(), r->artist_id(), r->album_id(),
                                    r->genre_id(), r->key_id(), r->tempo(), r->bitrate(),
                                    r->track_number(), r->label_id(), r->artwork_id(),
                                    r->year(), r->duration(), r->rating(),
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
                        } catch (const std::exception&) {
                            // One unreadable row must not lose the rest of the
                            // table; it is counted and reported instead.
                            ++row_errors;
                        }
                    }
                }
            }
            if (ref->index() == last) break;
            ref = page->next_page();
        }
      } catch (const std::exception&) {
        ++page_errors;
      }
    }

    if (tracks.empty() && nodes.empty() && entries.empty()) {
        std::cerr << "refusing " << pdb_path
                  << ": no tracks, playlists or entries were read; "
                     "this is not a usable export.pdb\n";
        return 1;
    }

    std::ostringstream o;
    o << "{\n \"source_pdb\": \"" << json_escape(pdb_path) << "\",\n";
    o << " \"counts\": {\"tracks\": " << tracks.size() << ", \"playlists\": "
      << nodes.size() << ", \"entries\": " << entries.size() << ", \"artists\": "
      << artists.size() << ", \"albums\": " << albums.size() << ", \"genres\": "
      << genres.size() << ", \"keys\": " << keys.size() << ", \"labels\": "
      << labels.size() << ", \"colors\": " << colors.size() << ", \"artwork\": "
      << artwork.size() << "},\n";
    o << " \"row_errors\": " << row_errors << ", \"table_errors\": "
      << page_errors << ",\n";

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
          << ", \"label\": \"" << json_escape(labels.count(t.label_id) ? labels[t.label_id] : "")
          << "\", \"artwork_path\": \"" << json_escape(artwork.count(t.artwork_id) ? artwork[t.artwork_id] : "")
          << "\", \"rating\": " << static_cast<int>(t.rating)
          << ", \"color_id\": " << static_cast<int>(t.color_id)
          << ", \"color\": \"" << json_escape(colors.count(t.color_id) ? colors[t.color_id] : "")
          << "\", \"comment\": \"" << json_escape(t.comment)
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
