#include "mem.h"

uint32_t Mem::read(uint32_t addr) {
    return mem[addr];
}

void Mem::write(uint32_t addr, uint32_t value) {
    mem[addr] = value;
}