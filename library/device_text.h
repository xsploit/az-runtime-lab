// Shared text/JSON helpers for the legacy Device Library extractors.
//
// Rekordbox device files store strings in several encodings: PDB device_sql
// strings may be short/long ASCII or UTF-16LE, while ANLZ path and cue comment
// fields are UTF-16BE with a trailing null. Kaitai hands all of them back as
// std::string byte containers, so conversion happens here.
#pragma once

#include <cstdint>
#include <cstdio>
#include <string>

namespace device_text {

// UTF-16 (either endianness) -> UTF-8. Embedded nulls are dropped: rekordbox
// device strings are known to carry stray null characters mid-field.
inline std::string utf16_to_utf8(const std::string& in, bool big_endian) {
    std::string out;
    for (size_t i = 0; i + 1 < in.size(); i += 2) {
        uint32_t hi = static_cast<uint8_t>(in[i]);
        uint32_t lo = static_cast<uint8_t>(in[i + 1]);
        uint32_t cp = big_endian ? ((hi << 8) | lo) : ((lo << 8) | hi);
        if (cp >= 0xD800 && cp <= 0xDBFF && i + 3 < in.size()) {
            uint32_t h2 = static_cast<uint8_t>(in[i + 2]);
            uint32_t l2 = static_cast<uint8_t>(in[i + 3]);
            uint32_t low = big_endian ? ((h2 << 8) | l2) : ((l2 << 8) | h2);
            if (low >= 0xDC00 && low <= 0xDFFF) {
                cp = 0x10000 + ((cp - 0xD800) << 10) + (low - 0xDC00);
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

inline std::string json_escape(const std::string& in) {
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

} // namespace device_text
