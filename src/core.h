#pragma once

#include <string>
#include "reg.h"
#include "mem.h"

class Core {
    public:
        // var
        Reg reg;
        Mem mem;
        FILE* trace;

        // init
        Core(std::string &trace_path, std::string &in_path, std::string &out_path);

        // main
        void init_trace(std::string &trace_path);
        void load_exec(std::string &path);
        void run();
        void boot();
};