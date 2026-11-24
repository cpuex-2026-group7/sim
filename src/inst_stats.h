#pragma once

#include <cstdint>
#include <cstdio>
#include "inst.h"

// counts which uop comes right before / after each uop (dynamic)
class InstStats {
    public:
        static constexpr int n = (int)Uop::COUNT;

        void step(Uop uop);
        void print_stats(FILE *out) const;

    private:
        uint64_t count[n][n] = {};
        uint64_t total[n] = {};
        Uop prev = Uop::NONE;
};
