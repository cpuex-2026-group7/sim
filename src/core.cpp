#include <cstdio>
#include <filesystem>
#include <bit>
#include <algorithm>

#include "core.h"
#include "inst.h"

using namespace std;

// init
Core::Core (std::string &path) {
    load_exec(path);
}

// main
void Core::load_exec(std::string &path) {
    // load binary
    FILE *fp = fopen(path.c_str(), "rb");
    if (!fp){ fprintf(stderr, "Failed to load the binary\n"); exit(1); }

    // load it to memory
    // NOTE: no header, big endian
    auto size = filesystem::file_size(path);
    if (size > Mem::mem_size * 4){ fprintf(stderr, "Binary is too large\n"); exit(1); }
    fread(mem.mem.data(), 1, size, fp);
    fclose(fp);
    
    // convert to big endian if necessary
    if constexpr (std::endian::native == std::endian::little){
        for (size_t i = 0; i < size / 4; i++){
            mem.mem[i] = std::byteswap(mem.mem[i]);
        }
    }
}

void Core::run(){ // main run loop
    while(true){
        // fetch inst
        uint32_t pc = reg.read_pc();
        if (pc >= Mem::mem_size){ fprintf(stderr, "pc is out of range: %u\n", pc); exit(1); }
        uint32_t raw = mem.read(pc);
        // decode
        Inst inst = Inst(raw);
        // execute
        bool res = inst.exec(reg, mem);
        if (!res) break;
    }
    reg.dump();
}