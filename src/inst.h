#pragma once

#include "reg.h"
#include "mem.h"

class Inst {
    public:
        // var
        uint32_t raw;
        // TOOD: op1 op2 imm ...

        // init
        Inst(uint32_t raw);

        // main
        void decode();
        bool exec(Reg &reg, Mem &mem);
};
