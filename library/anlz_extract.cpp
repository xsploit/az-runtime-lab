// Rekordbox ANLZ (.DAT/.EXT) -> JSON cue / loop / beat-grid record set.
//
// Reuses BiteDJ's generated Kaitai parser (rekordbox_anlz.{h,cpp}) plus the
// kaitai runtime; no Qt and no BiteDJ Track types. Section handling mirrors
// rekordboxfeature.cpp::readAnalyze, including its robustness rules:
//   * the beat grid comes from the .DAT;
//   * extended PCO2 entries carry colors, comments and loop fractions;
//   * extended entries only expose RGB once the optional tail is really there
//     (len_entry >= 48 && len_comment <= len_entry - 48), matching
//     extendedHotCueColor(); otherwise the colour is reported as absent;
//   * a parse failure on one file never aborts the run.
//
// Times are reported exactly as stored (milliseconds). No playback timing
// offset and no AZ column mapping is applied here -- this tool stays faithful
// to the source format so that preservation can be checked against it.
//
// Cue sources differ from BiteDJ deliberately. readAnalyzeFiles() reads cues
// from the .EXT when it exists and only falls back to the .DAT otherwise; on
// real exports the .DAT's PCOB and the .EXT's PCOB are different sets, so that
// rule can drop cues. This tool reads both by default and tags every cue with
// the file it came from (--cue-source selects the other policies for
// comparison).
//
// Usage:
//   anlz_extract [--out FILE] [--paths-from LIST] [--drive-root DIR]
//                [--cue-source both|dat|ext|auto] [PATH...]
// PATH/LIST entries may be .DAT or .EXT files, or paths relative to
// --drive-root (as stored in export.pdb's analyze_path).

#include <rekordbox_anlz.h>
#include <kaitai/kaitaistream.h>

#include "device_text.h"

#include <algorithm>
#include <fstream>
#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <vector>

using device_text::json_escape;
using device_text::utf16_to_utf8;

namespace {

// ANLZ text fields are UTF-16BE and carry a trailing null character.
std::string anlz_text(const std::string& raw) {
    return utf16_to_utf8(raw, /*big_endian=*/true);
}

struct Beat {
    int beat_number;   // 1..4 within the bar
    int tempo;         // bpm * 100, as stored
    long time_ms;
};

struct Cue {
    std::string file;    // "dat" or "ext" -- which member of the pair held it
    std::string source;  // "PCOB" (basic) or "PCO2" (extended)
    std::string list;    // "memory" or "hot"
    std::string type;    // "cue" or "loop"
    int hot_cue = 0;     // 1-based pad number for hot cue lists, else 0
    int status = -1;     // PCOB only; -1 when not applicable
    long time_ms = 0;
    long loop_time_ms = -1;      // -1 when this is not a loop
    int color_id = -1;           // PCO2 only
    bool has_rgb = false;
    int r = 0, g = 0, b = 0;
    int loop_numerator = -1, loop_denominator = -1;
    std::string comment;
};

// One definitive cue per slot. Real exports describe the same cue twice (the
// .DAT's legacy PCOB list, and the .EXT's PCOB subset plus its full PCO2 list),
// so a converter that wants to preserve cues needs them deduplicated. PCO2 wins
// because only it carries colour, loop fraction and comment; a disagreement on
// the cue time between representations is reported rather than silently hidden.
struct Merged {
    Cue cue;
    int representations = 0;
    bool time_conflict = false;
    long other_time_ms = -1;
};

struct Analysis {
    std::string dat_path, ext_path;
    std::string path_tag;         // audio path recorded inside the ANLZ
    bool dat_ok = false, ext_ok = false;
    std::string dat_error, ext_error;
    std::vector<std::string> dat_sections, ext_sections;  // fourcc, file order
    std::vector<Beat> beats;
    std::vector<Cue> cues;
    std::vector<Merged> merged;
    int time_conflicts = 0;
};

std::string fourcc_name(rekordbox_anlz_t::section_tags_t t) {
    switch (t) {
    case rekordbox_anlz_t::SECTION_TAGS_CUES: return "PCOB";
    case rekordbox_anlz_t::SECTION_TAGS_CUES_2: return "PCO2";
    case rekordbox_anlz_t::SECTION_TAGS_PATH: return "PPTH";
    case rekordbox_anlz_t::SECTION_TAGS_BEAT_GRID: return "PQTZ";
    case rekordbox_anlz_t::SECTION_TAGS_SONG_STRUCTURE: return "PSSI";
    case rekordbox_anlz_t::SECTION_TAGS_VBR: return "PVBR";
    case rekordbox_anlz_t::SECTION_TAGS_WAVE_PREVIEW: return "PWAV";
    case rekordbox_anlz_t::SECTION_TAGS_WAVE_TINY: return "PWV2";
    case rekordbox_anlz_t::SECTION_TAGS_WAVE_SCROLL: return "PWV3";
    case rekordbox_anlz_t::SECTION_TAGS_WAVE_COLOR_PREVIEW: return "PWV4";
    case rekordbox_anlz_t::SECTION_TAGS_WAVE_COLOR_SCROLL: return "PWV5";
    case rekordbox_anlz_t::SECTION_TAGS_WAVE_3BAND_PREVIEW: return "PWV6";
    case rekordbox_anlz_t::SECTION_TAGS_WAVE_3BAND_SCROLL: return "PWV7";
    }
    return "????";
}

// extendedHotCueColor() guard: the parser only fills the RGB fields when the
// whole optional tail is present, so length must be checked before reading.
bool extended_has_rgb(const rekordbox_anlz_t::cue_extended_entry_t& e) {
    return e.len_entry() >= 48 && e.len_comment() <= e.len_entry() - 48;
}

void read_file(const std::string& path, const char* which, bool want_beats,
        bool want_cues, Analysis* out, std::vector<std::string>* sections,
        std::string* error) {
    std::ifstream ifs(path, std::ifstream::binary);
    if (!ifs) {
        *error = "cannot open file";
        return;
    }
    kaitai::kstream ks(&ifs);
    rekordbox_anlz_t anlz(&ks);

    for (const auto& section : *anlz.sections()) {
        if (sections) sections->push_back(fourcc_name(section->fourcc()));
        switch (section->fourcc()) {
        case rekordbox_anlz_t::SECTION_TAGS_PATH: {
            auto* tag = static_cast<rekordbox_anlz_t::path_tag_t*>(section->body());
            if (tag->len_path() > 1 && out->path_tag.empty()) {
                out->path_tag = anlz_text(tag->path());
            }
        } break;
        case rekordbox_anlz_t::SECTION_TAGS_BEAT_GRID: {
            if (!want_beats) break;
            auto* tag = static_cast<rekordbox_anlz_t::beat_grid_tag_t*>(section->body());
            for (const auto& beat : *tag->beats()) {
                out->beats.push_back({static_cast<int>(beat->beat_number()),
                        static_cast<int>(beat->tempo()),
                        static_cast<long>(beat->time())});
            }
        } break;
        case rekordbox_anlz_t::SECTION_TAGS_CUES: {
            if (!want_cues) break;
            auto* tag = static_cast<rekordbox_anlz_t::cue_tag_t*>(section->body());
            const bool hot = tag->type() == rekordbox_anlz_t::CUE_LIST_TYPE_HOT_CUES;
            for (const auto& e : *tag->cues()) {
                Cue c;
                c.file = which;
                c.source = "PCOB";
                c.list = hot ? "hot" : "memory";
                c.hot_cue = hot ? static_cast<int>(e->hot_cue()) : 0;
                c.status = static_cast<int>(e->status());
                c.time_ms = static_cast<long>(e->time());
                if (e->type() == rekordbox_anlz_t::CUE_ENTRY_TYPE_LOOP) {
                    c.type = "loop";
                    c.loop_time_ms = static_cast<long>(e->loop_time());
                } else {
                    c.type = "cue";
                }
                out->cues.push_back(std::move(c));
            }
        } break;
        case rekordbox_anlz_t::SECTION_TAGS_CUES_2: {
            if (!want_cues) break;
            auto* tag = static_cast<rekordbox_anlz_t::cue_extended_tag_t*>(section->body());
            const bool hot = tag->type() == rekordbox_anlz_t::CUE_LIST_TYPE_HOT_CUES;
            for (const auto& e : *tag->cues()) {
                Cue c;
                c.file = which;
                c.source = "PCO2";
                c.list = hot ? "hot" : "memory";
                c.hot_cue = hot ? static_cast<int>(e->hot_cue()) : 0;
                c.time_ms = static_cast<long>(e->time());
                if (e->type() == rekordbox_anlz_t::CUE_ENTRY_TYPE_LOOP) {
                    c.type = "loop";
                    c.loop_time_ms = static_cast<long>(e->loop_time());
                    c.loop_numerator = static_cast<int>(e->loop_numerator());
                    c.loop_denominator = static_cast<int>(e->loop_denominator());
                } else {
                    c.type = "cue";
                }
                c.color_id = static_cast<int>(e->color_id());
                c.comment = anlz_text(e->comment());
                if (extended_has_rgb(*e)) {
                    c.has_rgb = true;
                    c.r = static_cast<int>(e->color_red());
                    c.g = static_cast<int>(e->color_green());
                    c.b = static_cast<int>(e->color_blue());
                }
                out->cues.push_back(std::move(c));
            }
        } break;
        default:
            break;
        }
    }
}

std::string swap_extension(const std::string& path, const std::string& ext) {
    if (path.size() < 3) return path;
    return path.substr(0, path.size() - 3) + ext;
}

bool file_exists(const std::string& path) {
    std::ifstream f(path, std::ifstream::binary);
    return static_cast<bool>(f);
}

enum class CueSource { Both, Dat, Ext, Auto };

Analysis analyse(const std::string& input, CueSource policy) {
    // Accept either half of the pair; normalise to the .DAT member.
    std::string dat = input;
    if (input.size() >= 4) {
        std::string tail = input.substr(input.size() - 4);
        for (auto& c : tail) c = static_cast<char>(std::toupper(c));
        if (tail == ".EXT") dat = swap_extension(input, "DAT");
    }
    Analysis a;
    a.dat_path = dat;

    const std::string ext = swap_extension(dat, "EXT");
    const bool have_ext = file_exists(ext);

    // Which member of the pair may contribute cues. Default "both": the .DAT's
    // PCOB and the .EXT's PCOB/PCO2 are NOT the same set on real exports (the
    // .DAT carries the legacy list, the .EXT the extended one), so taking only
    // the .EXT -- the rule readAnalyzeFiles() uses -- can silently drop cues.
    const bool dat_cues = policy == CueSource::Both || policy == CueSource::Dat ||
            (policy == CueSource::Auto && !have_ext);
    const bool ext_cues = have_ext &&
            (policy == CueSource::Both || policy == CueSource::Ext ||
                    policy == CueSource::Auto);

    try {
        read_file(dat, "dat", /*want_beats=*/true, dat_cues, &a,
                &a.dat_sections, &a.dat_error);
        a.dat_ok = a.dat_error.empty();
    } catch (const std::exception& e) {
        a.dat_error = e.what();
    }

    if (have_ext) {
        a.ext_path = ext;
        try {
            read_file(ext, "ext", /*want_beats=*/false, ext_cues, &a,
                    &a.ext_sections, &a.ext_error);
            a.ext_ok = a.ext_error.empty();
        } catch (const std::exception& e) {
            a.ext_error = e.what();
        }
    }
    return a;
}

// Hot cues are identified by their pad; memory cues have no pad, so they are
// identified by position. Insertion order is preserved for stable output.
void merge_cues(Analysis* a) {
    std::vector<std::pair<std::string, size_t>> order;  // key -> index in merged
    auto find = [&](const std::string& key) -> Merged* {
        for (auto& [k, idx] : order) {
            if (k == key) return &a->merged[idx];
        }
        return nullptr;
    };
    for (const Cue& c : a->cues) {
        const std::string key = c.list == "hot"
                ? "hot:" + std::to_string(c.hot_cue)
                : "mem:" + std::to_string(c.time_ms);
        Merged* existing = find(key);
        if (!existing) {
            Merged m;
            m.cue = c;
            m.representations = 1;
            order.emplace_back(key, a->merged.size());
            a->merged.push_back(std::move(m));
            continue;
        }
        existing->representations++;
        if (existing->cue.time_ms != c.time_ms) {
            existing->time_conflict = true;
            existing->other_time_ms = c.time_ms;
            a->time_conflicts++;
        }
        // PCO2 is the richer representation and wins the slot.
        if (c.source == "PCO2" && existing->cue.source != "PCO2") {
            const int reps = existing->representations;
            const bool conflict = existing->time_conflict;
            const long other = existing->other_time_ms;
            existing->cue = c;
            existing->representations = reps;
            existing->time_conflict = conflict;
            existing->other_time_ms = other;
        }
    }
}

void emit_cue_body(std::ostream& o, const Cue& c) {
    o << "\"file\": \"" << c.file << "\", \"source\": \"" << c.source
      << "\", \"list\": \"" << c.list << "\", \"type\": \"" << c.type
      << "\", \"hot_cue\": " << c.hot_cue << ", \"time_ms\": " << c.time_ms;
    if (c.loop_time_ms >= 0) o << ", \"loop_time_ms\": " << c.loop_time_ms;
    if (c.status >= 0) o << ", \"status\": " << c.status;
    if (c.color_id >= 0) o << ", \"color_id\": " << c.color_id;
    if (c.has_rgb) o << ", \"rgb\": [" << c.r << ", " << c.g << ", " << c.b << "]";
    if (c.loop_numerator >= 0)
        o << ", \"loop_numerator\": " << c.loop_numerator
          << ", \"loop_denominator\": " << c.loop_denominator;
    if (!c.comment.empty()) o << ", \"comment\": \"" << json_escape(c.comment) << "\"";
}

void emit(std::ostream& o, const Analysis& a) {
    o << "  {\"dat_path\": \"" << json_escape(a.dat_path) << "\"";
    o << ", \"ext_path\": \"" << json_escape(a.ext_path) << "\"";
    o << ", \"dat_ok\": " << (a.dat_ok ? "true" : "false");
    o << ", \"ext_ok\": " << (a.ext_ok ? "true" : "false");
    if (!a.dat_error.empty()) o << ", \"dat_error\": \"" << json_escape(a.dat_error) << "\"";
    if (!a.ext_error.empty()) o << ", \"ext_error\": \"" << json_escape(a.ext_error) << "\"";
    o << ", \"path_tag\": \"" << json_escape(a.path_tag) << "\"";

    auto emit_sections = [&o](const char* name, const std::vector<std::string>& v) {
        o << ", \"" << name << "\": [";
        for (size_t i = 0; i < v.size(); ++i) {
            o << "\"" << v[i] << "\"" << (i + 1 < v.size() ? ", " : "");
        }
        o << "]";
    };
    emit_sections("dat_sections", a.dat_sections);
    emit_sections("ext_sections", a.ext_sections);

    o << ", \"beat_count\": " << a.beats.size();
    o << ", \"beats\": [";
    for (size_t i = 0; i < a.beats.size(); ++i) {
        const Beat& b = a.beats[i];
        o << "[" << b.beat_number << ", " << b.tempo << ", " << b.time_ms << "]"
          << (i + 1 < a.beats.size() ? ", " : "");
    }
    o << "]";

    o << ", \"cues\": [";
    for (size_t i = 0; i < a.cues.size(); ++i) {
        const Cue& c = a.cues[i];
        o << "\n   {";
        emit_cue_body(o, c);
        o << "}" << (i + 1 < a.cues.size() ? "," : "");
    }
    o << (a.cues.empty() ? "]" : "\n  ]");

    o << ", \"time_conflicts\": " << a.time_conflicts;
    o << ", \"merged_cues\": [";
    for (size_t i = 0; i < a.merged.size(); ++i) {
        const Merged& m = a.merged[i];
        o << "\n   {";
        emit_cue_body(o, m.cue);
        o << ", \"representations\": " << m.representations;
        if (m.time_conflict) o << ", \"time_conflict_with_ms\": " << m.other_time_ms;
        o << "}" << (i + 1 < a.merged.size() ? "," : "");
    }
    o << (a.merged.empty() ? "]" : "\n  ]");
    o << "}";
}

} // namespace

int main(int argc, char** argv) {
    std::vector<std::string> inputs;
    std::string out_path, drive_root;
    CueSource policy = CueSource::Both;
    for (int i = 1; i < argc; ++i) {
        std::string a = argv[i];
        if (a == "--out" && i + 1 < argc) {
            out_path = argv[++i];
        } else if (a == "--drive-root" && i + 1 < argc) {
            drive_root = argv[++i];
        } else if (a == "--cue-source" && i + 1 < argc) {
            std::string v = argv[++i];
            if (v == "both") policy = CueSource::Both;
            else if (v == "dat") policy = CueSource::Dat;
            else if (v == "ext") policy = CueSource::Ext;
            else if (v == "auto") policy = CueSource::Auto;
            else { std::cerr << "bad --cue-source " << v << "\n"; return 2; }
        } else if (a == "--paths-from" && i + 1 < argc) {
            std::ifstream list(argv[++i]);
            if (!list) {
                std::cerr << "cannot read path list\n";
                return 1;
            }
            std::string line;
            while (std::getline(list, line)) {
                if (!line.empty() && line.back() == '\r') line.pop_back();
                if (!line.empty()) inputs.push_back(line);
            }
        } else if (a.rfind("--", 0) == 0) {
            std::cerr << "unknown option " << a << "\n";
            return 2;
        } else {
            inputs.push_back(a);
        }
    }
    if (inputs.empty()) {
        std::cerr << "usage: anlz_extract [--out FILE] [--drive-root DIR] "
                     "[--paths-from LIST]\n"
                     "                    [--cue-source both|dat|ext|auto] [PATH...]\n";
        return 2;
    }

    std::ostringstream o;
    o << "{\n \"analyses\": [\n";
    size_t ok = 0, failed = 0, with_cues = 0, with_beats = 0, total_cues = 0;
    size_t merged_cues = 0, conflicts = 0;
    for (size_t i = 0; i < inputs.size(); ++i) {
        std::string p = inputs[i];
        // Relative analyze_path values are resolved against the export root.
        if (!drive_root.empty() && !p.empty() && p[0] == '/') {
            p = drive_root + p;
        } else if (!drive_root.empty() && p.find('/') != 0 && p.find(drive_root) != 0) {
            p = drive_root + "/" + p;
        }
        Analysis a = analyse(p, policy);
        merge_cues(&a);
        if (a.dat_ok) ++ok; else ++failed;
        if (!a.cues.empty()) ++with_cues;
        if (!a.beats.empty()) ++with_beats;
        total_cues += a.cues.size();
        merged_cues += a.merged.size();
        conflicts += static_cast<size_t>(a.time_conflicts);
        emit(o, a);
        o << (i + 1 < inputs.size() ? ",\n" : "\n");
    }
    o << " ],\n";
    o << " \"summary\": {\"inputs\": " << inputs.size() << ", \"dat_parsed\": " << ok
      << ", \"dat_failed\": " << failed << ", \"with_beat_grid\": " << with_beats
      << ", \"with_cues\": " << with_cues << ", \"total_cues\": " << total_cues
      << ", \"merged_cues\": " << merged_cues << ", \"time_conflicts\": " << conflicts
      << "}\n}\n";

    if (out_path.empty()) {
        std::cout << o.str();
    } else {
        std::ofstream ofs(out_path);
        ofs << o.str();
        std::cerr << "wrote " << out_path << " (" << ok << " parsed, " << failed
                  << " failed, " << total_cues << " cues -> " << merged_cues
                  << " merged, " << conflicts << " time conflicts, " << with_beats
                  << " with beat grids)\n";
    }
    return 0;
}
