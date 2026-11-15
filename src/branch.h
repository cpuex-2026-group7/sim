#pragma once

#include <cstdint>
#include <cstdio>
#include <vector>

class BranchPredictor {
    public:
        static constexpr int idx_bits = 7;
        static constexpr int tag_bits = 9;
        static constexpr int entries = 1 << idx_bits;
        static constexpr int pc_bits = 16;

        enum class Type { None, Branch, Jal, Jalr };

        struct Result {
            bool f3_redirect = false;
            bool mispredict = false;
        };

        struct Stats {
            uint64_t insts = 0;
            uint64_t branch = 0, jal = 0, jalr = 0;
            uint64_t branch_taken = 0;
            uint64_t btb_hit = 0;
            uint64_t f3_redirect[4] = {};
            uint64_t mispredict[4] = {};
        };

        Stats stats;

        BranchPredictor();

        Result step(uint32_t pc, Type type, uint32_t static_tgt, uint32_t actual_next);
        void print_stats(FILE *out) const;

    private:
        struct Entry { bool valid = false; uint32_t tag = 0; uint32_t target = 0; };
        std::vector<Entry> btb;

        // utils
        static uint32_t index_of(uint32_t pc) { return pc & (entries - 1); }
        static uint32_t tag_of(uint32_t pc) { return (pc >> idx_bits) & ((1u << tag_bits) - 1); }
        void update(uint32_t pc, bool valid, uint32_t target);
};
