#include "inst.h"

Inst::Inst(uint32_t raw) : raw(raw) {
    decode();
}

void Inst::decode(){
    // TODO: decode raw to op1 op2 imm ...
}

bool Inst::exec(Reg &reg, Mem &mem){
    // TODO: execute instrutions
    // TODO: calc timing?
    reg.incr_pc();
    return true;
}
