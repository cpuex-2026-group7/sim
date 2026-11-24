#pragma once

#include <cstdint>
#include <cstdio>
#include <vector>

// default: 2-way, 256sets, 1line 4word, LRU, write-back, write-allocate
class DCache {
    public:
        struct Config {
            uint32_t line_words = 4;
            uint32_t sets = 256;
            uint32_t ways = 2;
        };

        struct Stats {
            uint64_t read_hit = 0, read_miss = 0;
            uint64_t write_hit = 0, write_miss = 0;
            uint64_t writeback = 0;
        };
        Stats stats;

        DCache() : DCache(Config{}) {}
        DCache(const Config &cfg);

        bool access(uint32_t addr, bool is_write);
        void print_stats(FILE *f) const;

    private:
        struct Line { bool valid = false, dirty = false; uint32_t tag = 0; uint64_t last_use = 0; };
        Config cfg;
        std::vector<Line> lines;
        uint64_t tick = 0;
};
