#pragma once

#include <string>
#include "reg.h"
#include "mem.h"
#include "branch.h"
#include "inst_stats.h"

class Core {
    public:
        // var
        Reg reg;
        Mem mem;
        FILE* trace;
        bool cache_stats = false;
        bool branch_stats = false;
        bool inst_stats = false;
        BranchPredictor bp;
        InstStats ist;

        // init
        Core(std::string &trace_path, std::string &in_path, std::string &out_path, DCache::Config cc = {});

        // main
        void init_trace(std::string &trace_path);
        void load_exec(std::string &path);
        void run();
        void boot();
        void load_input();
};