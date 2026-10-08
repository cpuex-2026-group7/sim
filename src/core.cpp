#include <cstdio>
#include <filesystem>

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
    if (!fp){ printf("Failed to load the binary\n"); exit(1); }

    // load it to memory
    auto size = filesystem::file_size(path);
    if (size > Mem::mem_size){ printf("Binary is too large\n"); exit(1); }
    fread(mem.mem.data(), 1, size, fp);
    fclose(fp);
}

void Core::run(){ // main run loop
    while(true){
        // fetch inst
        uint32_t raw = mem.read(reg.read_pc());
        // decode
        Inst inst = Inst(raw);
        // execute
        bool res = inst.exec(reg, mem);
        if (!res) break;
    }
}