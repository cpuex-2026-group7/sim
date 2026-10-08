#pragma once

#include <string>
#include "reg.h"
#include "mem.h"

class Core {
    public:
        // var
        Reg reg;
        Mem mem;

        // init
        Core(std::string &path);

        // main
        void load_exec(std::string &path);
        void run();
};