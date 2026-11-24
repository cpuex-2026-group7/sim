#include <cstdlib>
#include <cstdio>
#include "mem.h"

Mem::Mem(std::string &in_path, std::string &out_path, DCache::Config cc) : imem(imem_size, 0x0), dmem(dmem_size, 0x0), dcache(cc) {
    if (!in_path.empty()){
        uart_in = fopen(in_path.c_str(), "rb");
        if (!uart_in){ fprintf(stderr, "Failed to open the input file\n"); exit(1); }
    }
    if (!out_path.empty()){
        uart_out = fopen(out_path.c_str(), "w");
        if (!uart_out){ fprintf(stderr, "Failed to open the uart output file\n"); exit(1); }
    }
}

uint32_t Mem::read_data(uint32_t addr) {
    if (addr == uart_tx) {
        fprintf(stderr, "Data memory read from uart_tx: %u\n", addr);
        exit(1);
    } else if (addr >= dmem_size) {
        fprintf(stderr, "Data memory read out of range: %u\n", addr);
        exit(1);
    } 
    dcache.access(addr, false);
    return dmem[addr];
}

void Mem::write_data(uint32_t addr, uint32_t value) {
    trace = {true, addr, value};
    if (addr == uart_tx) {
        return uart_send(value);
    } else if (addr >= dmem_size) {
        fprintf(stderr, "Data memory write out of range: %u\n", addr);
        exit(1);
    } 
    dcache.access(addr, true);
    dmem[addr] = value;
}

uint32_t Mem::read_inst(uint32_t addr){
    if (addr >= imem_size) {
        fprintf(stderr, "Inst memory read out of range: %u\n", addr);
        exit(1);
    }
    return imem[addr];
}

void Mem::write_inst(uint32_t addr, uint32_t value){
    if (addr >= imem_size) {
         fprintf(stderr, "Inst memory write out of range: %u\n", addr);
        exit(1);
    }
    trace = {true, addr, value};
    imem[addr] = value;
}

void Mem::uart_send(uint32_t value){
    fputc(value & 0xff, uart_out);
    fflush(uart_out);
}

// NOTE: little endian (server.py default)
uint32_t Mem::uart_recv_word(){
    uint32_t value = 0;
    for (int i = 0; i < 4; i++){
        int c = fgetc(uart_in);
        if (c == EOF){
            fprintf(stderr, "UART input EOF\n");
            exit(1);
        }
        value |= (uint32_t)(c & 0xff) << (8 * i);
    }
    return value;
}

// read the rest of the input until EOF
void Mem::load_data_from_input(){
    size_t i = 0;
    int c;
    while ((c = fgetc(uart_in)) != EOF){
        if (i >= (size_t)dmem_size * 4){ fprintf(stderr, "Input is too large for data memory\n"); exit(1); }
        dmem[i / 4] |= (uint32_t)(c & 0xff) << (8 * (i % 4));
        i++;
    }
}
