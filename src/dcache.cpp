#include "dcache.h"

bool DCache::access(uint32_t addr, bool is_write) {
    uint32_t index = (addr / line_words) % sets;
    uint32_t tag = addr / (line_words * sets);
    Line *set = &lines[index * ways];

    bool hit = false;
    uint32_t way = 0;
    for (uint32_t w = 0; w < ways; w++) { // check all ways
        if (set[w].valid && set[w].tag == tag) { hit = true; way = w; break; }
    }
    if (!hit) { // miss
        way = lru[index]; 
        if (set[way].valid && set[way].dirty) stats.writeback++;
        set[way] = {true, false, tag};
    }
    lru[index] = 1 - way; // NOTE: 2-way only
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
    fprintf(f, "=== DCache Stats ===\n");
    fprintf(f, "D$: %llu accesses, %llu miss (cache miss rate: %.2f%%)\n", (unsigned long long)all,
            (unsigned long long)miss, all ? 100.0 * miss / all : 0.0);
    fprintf(f, "  load : %llu hit, %llu miss\n", (unsigned long long)stats.read_hit, (unsigned long long)stats.read_miss);
    fprintf(f, "  store: %llu hit, %llu miss\n", (unsigned long long)stats.write_hit, (unsigned long long)stats.write_miss);
    fprintf(f, "  writeback: %llu\n", (unsigned long long)stats.writeback);
}
