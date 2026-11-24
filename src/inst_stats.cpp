#include <algorithm>
#include <utility>
#include <vector>
#include "inst_stats.h"

static const char *names[InstStats::n] = {
    "BEQ", "BNE", "BLT", "BGE", "JAL", "JALR", "SRA", "ADDI", "ADD", "SUB", "LOAD", "STORE",
    "FBEQ", "FBNE", "FBLT", "FBGE", "FLI", "FLHI", "FTOI", "ITOF", "FCSIGN", "FSQRT", "FADD", "FSUB", "FMUL", "FDIV"
};

void InstStats::step(Uop uop) {
    if (uop == Uop::NONE) return; // nop, halt: skipped
    total[(int)uop]++;
    if (prev != Uop::NONE) count[(int)prev][(int)uop]++;
    prev = uop;
}

void InstStats::print_stats(FILE *out) const {
    fprintf(out, "=== Inst Stats (prev / next of each uop) ===\n");
    for (int i = 0; i < n; i++) {
        if (!total[i]) continue;
        fprintf(out, "%s: %llu\n", names[i], (unsigned long long)total[i]);
        for (int dir = 0; dir < 2; dir++) { // 0: prev, 1: next
            std::vector<std::pair<uint64_t, int>> v;
            uint64_t sum = 0;
            for (int j = 0; j < n; j++) {
                uint64_t c = dir == 0 ? count[j][i] : count[i][j];
                if (c) { v.push_back({c, j}); sum += c; }
            }
            std::sort(v.begin(), v.end(), [](auto &a, auto &b) { return a.first > b.first; });
            fprintf(out, "  %s:", dir == 0 ? "prev" : "next");
            for (int k = 0; k < (int)v.size(); k++)
                fprintf(out, " %s %.1f%%(%llu)", names[v[k].second], 100.0 * v[k].first / sum, (unsigned long long)v[k].first);
            fprintf(out, "\n");
        }
    }
}
