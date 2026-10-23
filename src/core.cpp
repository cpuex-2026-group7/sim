#include <cstdio>
#include <filesystem>
#include <bit>
#include <algorithm>

#include "core.h"
#include "inst.h"

using namespace std;

// init
Core::Core (std::string &trace_path, std::string &in_path, std::string &out_path): reg(), mem(in_path, out_path) {
    init_trace(trace_path);
}

// main
void Core::init_trace(std::string &trace_path){
    if (trace_path == ""){
        trace = nullptr;
    } else {
        trace = fopen(trace_path.c_str(), "w");
        if (!trace){ fprintf(stderr, "Failed to open the trace file\n"); exit(1); }
    }
}

void Core::load_exec(std::string &path) {
    // load binary
    FILE *fp = fopen(path.c_str(), "rb");
    if (!fp){ fprintf(stderr, "Failed to load the binary\n"); exit(1); }

    // load it to memory
    // NOTE: no header, big endian
    auto size = filesystem::file_size(path);
    if (size > Mem::imem_size * 4){ fprintf(stderr, "Binary is too large\n"); exit(1); }
    fread(mem.imem.data(), 1, size, fp);
    fclose(fp);

    // convert to big endian if necessary
    if constexpr (std::endian::native == std::endian::little){
        for (size_t i = 0; i < size / 4; i++){
            mem.imem[i] = std::byteswap(mem.imem[i]);
        }
    }
}

void Core::run(){ // main run loop
    uint64_t cycle = 0;
    while(true){
        // fetch inst
        uint32_t pc = reg.read_pc();
        if (pc >= Mem::imem_size){ fprintf(stderr, "pc is out of range: %u\n", pc); exit(1); }
        uint32_t raw = mem.read_inst(pc);
        // decode
        Inst inst = Inst(raw);
        // execute
        bool res = inst.exec(reg, mem);
        // trace
        if (trace){
            if (!res) fprintf(trace, "halt\n");
            else if (reg.trace.valid) fprintf(trace, "%s%02d=%08x\n", reg.trace.is_f ? "f" : "x", reg.trace.num, reg.trace.value);
            else if (mem.trace.valid) fprintf(trace, "M[%08x]=%08x\n", mem.trace.addr, mem.trace.value);
            reg.trace.valid = mem.trace.valid = false;

            // old-style
            // if (!res) fprintf(trace, "halt pc=%08x\n", pc);
            // else if (reg.trace.valid) fprintf(trace, "pc=%08x ins=%08x %s%02d=%08x  # c=%llu\n", pc, raw, reg.trace.is_f ? "f" : "x", reg.trace.num, reg.trace.value, (unsigned long long)cycle);
            // else if (mem.trace.valid) fprintf(trace, "pc=%08x ins=%08x M[%08x]=%08x  # c=%llu\n", pc, raw, mem.trace.addr, mem.trace.value, (unsigned long long)cycle);
            // else fprintf(trace, "pc=%08x ins=%08x  # c=%llu\n", pc, raw, (unsigned long long)cycle);
            // reg.trace.valid = mem.trace.valid = false;
        }
        cycle++;
        if (!res) break;
    }
    // dump
    if (trace) fclose(trace);
    reg.dump();
}

void Core::boot(){
    // simulate bootloader procedure
    // send 0x99
    mem.uart_send(0x99);
    // recv prog size
    uint32_t n = mem.uart_recv_word();
    if (n % 4 != 0){ fprintf(stderr, "Invalid program size: %u\n", n);exit(1);}
    if (n / 4 > Mem::imem_size){ fprintf(stderr, "Received program size is too large: %u\n", n);exit(1);}
    // recv prog data
    for (uint32_t i = 0; i < n / 4; i++){
        uint32_t word = mem.uart_recv_word();
        mem.imem[i] = word;
    }
    // send 0xaa
    mem.uart_send(0xaa);
}