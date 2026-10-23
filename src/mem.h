#pragma once

#include <vector>
#include <cstdint>
#include <string>
#include <cstdio>

struct MemRWTrace {
    bool valid = false;
    uint32_t addr;
    uint32_t value;
};

class Mem {
    public:
        // const
        static constexpr int imem_size = 1024 * 1024 / 4; // word
        static constexpr int dmem_size = 1024 * 1024 / 4; // word
        static constexpr uint32_t uart_rx = 0xffffffff;
        static constexpr uint32_t uart_tx = 0xfffffffe;

        // i/o
        FILE* uart_in = stdin;
        FILE* uart_out = stdout;

        // mem (word aligned)
        std::vector<uint32_t> imem; // NOTE: 全体のメモリ確保が必要だが、アクセスが早い cf. map
        std::vector<uint32_t> dmem; 
        MemRWTrace trace;

        // init
        Mem(std::string &in_path, std::string &out_path);

        // access
        uint32_t read_data(uint32_t addr);
        void write_data(uint32_t addr, uint32_t value);
        uint32_t read_inst(uint32_t addr);
        void write_inst(uint32_t addr, uint32_t value);

        // uart
        void uart_send(uint32_t value);
        uint32_t uart_recv_word();
};
