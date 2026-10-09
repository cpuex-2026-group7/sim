#pragma once

#include "reg.h"
#include "mem.h"

class Inst {
    public:
        // var
        uint32_t raw;
        uint32_t opcode;
        uint32_t unit_type;
        uint32_t eff_type;
        uint32_t imm_type;
        uint32_t op_id;
        
        // arg
        uint32_t rd;
        uint32_t rs1;
        uint32_t rs2;
        uint32_t imm;

        // init
        Inst(uint32_t raw);

        // main
        void decode();
        bool exec(Reg &reg, Mem &mem);
};
