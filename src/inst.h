#pragma once

#include "reg.h"
#include "mem.h"
#include "branch.h"

// micro-op kind
enum class Uop : uint8_t {
    BEQ, BNE, BLT, BGE, JAL, JALR, SRA, ADDI, ADD, SUB, LOAD, STORE,
    FBEQ, FBNE, FBLT, FBGE, FLI, FLHI, FTOI, ITOF, FCSIGN, FSQRT, FADD, FSUB, FMUL, FDIV,
    COUNT, NONE = COUNT
};

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

        // branch info
        BranchPredictor::Type branch_type() const;

        // uop info
        Uop uop() const;
        uint32_t static_target(uint32_t pc) const { return pc + imm; }  // for Branch/Jal
};
