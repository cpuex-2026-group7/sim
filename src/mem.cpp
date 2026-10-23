#include <cstdlib>
#include <cstdio>
#include "mem.h"

Mem::Mem(std::string &in_path, std::string &out_path) : imem(imem_size, 0x0), dmem(dmem_size, 0x0) {
    if (!in_path.empty()){
        uart_in = fopen(in_path.c_str(), "r");
        if (!uart_in){ fprintf(stderr, "Failed to open the uart input file\n"); exit(1); }
    }
    if (!out_path.empty()){
        uart_out = fopen(out_path.c_str(), "w");
        if (!uart_out){ fprintf(stderr, "Failed to open the uart output file\n"); exit(1); }
    }
}

uint32_t Mem::read_data(uint32_t addr) {
    if (addr == uart_rx) {
        return uart_recv_word();
    } else if (addr == uart_tx) {
        fprintf(stderr, "Data memory read from uart_tx: %u\n", addr);
        exit(1);
    } else if (addr >= dmem_size) {
        fprintf(stderr, "Data memory read out of range: %u\n", addr);
        exit(1);
    } 
    return dmem[addr];
}

void Mem::write_data(uint32_t addr, uint32_t value) {
    trace = {true, addr, value};
    if (addr == uart_tx) {
        return uart_send(value);
    } else if (addr == uart_rx) {
        fprintf(stderr, "Data memory write to uart_rx: %u\n", addr);
        exit(1);
    } else if (addr >= dmem_size) {
        fprintf(stderr, "Data memory write out of range: %u\n", addr);
        exit(1);
    } 
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

uint32_t Mem::uart_recv_word(){
    uint32_t value = 0;
    for (int i = 0; i < 4; i++){
        int c = fgetc(uart_in);
        if (c == EOF){
            fprintf(stderr, "UART input EOF\n");
            exit(1);
        }
        value = (value << 8) | (c & 0xff);
    }
    return value;
}