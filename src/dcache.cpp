#include <cstdlib>
#include "dcache.h"

static bool is_pow2(uint32_t x) { return x && !(x & (x - 1)); }

DCache::DCache(const Config &c) : cfg(c) {
    if (!is_pow2(cfg.line_words) || !is_pow2(cfg.sets) || cfg.ways == 0) {
        fprintf(stderr, "Invalid cache config: line_words and sets must be powers of 2, ways >= 1\n");
        exit(1);
    }
    lines.resize((size_t)cfg.sets * cfg.ways);
}

bool DCache::access(uint32_t addr, bool is_write) {
    uint32_t index = (addr / cfg.line_words) % cfg.sets;
    uint32_t tag = addr / (cfg.line_words * cfg.sets);
    Line *set = &lines[(size_t)index * cfg.ways];

    bool hit = false;
    uint32_t way = 0;
    for (uint32_t w = 0; w < cfg.ways; w++) { // check all ways
        if (set[w].valid && set[w].tag == tag) { hit = true; way = w; break; }
    }
    if (!hit) { // miss: invalid way first, else LRU
        way = 0;
        for (uint32_t w = 0; w < cfg.ways; w++) {
            if (!set[w].valid) { way = w; break; }
            if (set[w].last_use < set[way].last_use) way = w;
        }
        if (set[way].valid && set[way].dirty) stats.writeback++;
        set[way] = {true, false, tag, 0};
    }
    set[way].last_use = ++tick;
    if (is_write) set[way].dirty = true;

    uint64_t &counter = is_write ? (hit ? stats.write_hit : stats.write_miss)
                                 : (hit ? stats.read_hit : stats.read_miss);
    counter++;
    return hit;
}

void DCache::print_stats(FILE *f) const {
    uint64_t reads = stats.read_hit + stats.read_miss;
    uint64_t writes = stats.write_hit + stats.write_miss;
    uint64_t all = reads + writes, miss = stats.read_miss + stats.write_miss;
    fprintf(f, "=== DCache Stats (%u-way, %u sets, %u words/line = %u words) ===\n", cfg.ways, cfg.sets, cfg.line_words, cfg.ways * cfg.sets * cfg.line_words);
    fprintf(f, "D$: %llu accesses, %llu miss (cache miss rate: %.2f%%)\n", (unsigned long long)all,
            (unsigned long long)miss, all ? 100.0 * miss / all : 0.0);
    fprintf(f, "  load : %llu hit, %llu miss\n", (unsigned long long)stats.read_hit, (unsigned long long)stats.read_miss);
    fprintf(f, "  store: %llu hit, %llu miss\n", (unsigned long long)stats.write_hit, (unsigned long long)stats.write_miss);
    fprintf(f, "  writeback: %llu\n", (unsigned long long)stats.writeback);
}
