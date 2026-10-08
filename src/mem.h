#pragma once

#include <vector>

class Mem {
    public:
        // const
        static constexpr int mem_size = 1024 * 1024; // TODO: 一旦1MB

        // mem (word aligned)
        std::vector<uint32_t> mem; // NOTE: 全体のメモリ確保が必要だが、アクセスが早い cf. map

        // init
        Mem() : mem(mem_size / 4, 0x0) {} // byte -> word

        // access
        uint32_t read(uint32_t addr);
        void write(uint32_t addr, uint32_t value);
};  