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
        Core(std::string &path, std::string &trace_path);

        // main
        void init_trace(std::string &trace_path);
        void load_exec(std::string &path);
        void run();
};