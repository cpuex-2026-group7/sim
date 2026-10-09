#include "mem.h"

uint32_t Mem::read(uint32_t addr) {
    if (addr >= mem_size) {
        fprintf(stderr, "Memory read out of range: %u\n", addr);
        exit(1);
    }
    return mem[addr];
}

void Mem::write(uint32_t addr, uint32_t value) {
    if (addr >= mem_size) {
         fprintf(stderr, "Memory write out of range: %u\n", addr);
        exit(1);
    }
    mem[addr] = value;
}