#pragma once

#include <stdint.h>

enum UnitType : uint32_t {
    UNIT_ALU,
    UNIT_FPU
};

enum EffType : uint32_t { 
    EFF_NONE,
    EFF_WI,
    EFF_WF,
    EFF_MEM
};

enum ImmType : uint32_t {
    IMM_A,
    IMM_B,
    IMM_C,
    IMM_D
};