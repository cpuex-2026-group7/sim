#pragma once

#include <array>
#include <cstdint>
#include <cstdio>
#include <vector>

// 2-way, 256sets, 1line 4word, LRU, write-back, write-allocate
class DCache {
    public:
        static constexpr uint32_t line_words = 4;
        static constexpr uint32_t sets = 256;
        static constexpr uint32_t ways = 2;

        struct Stats {
            uint64_t read_hit = 0, read_miss = 0;
            uint64_t write_hit = 0, write_miss = 0;
            uint64_t writeback = 0;
        };
        Stats stats;

        DCache() : lines(sets * ways), lru(sets, 0) {}

        bool access(uint32_t addr, bool is_write);
        void print_stats(FILE *f) const;

    private:
        struct Line { bool valid = false, dirty = false; uint32_t tag = 0; };
        std::vector<Line> lines;
        std::vector<uint8_t> lru;
};
