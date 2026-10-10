#pragma once

#include <cstdint>
#include <vector>

struct RegRWTrace {
    bool valid = false;
    bool is_f;
    int num;
    uint32_t value;
};

class Reg {
    public:
        // const
        static constexpr int x_size = 32;
        static constexpr int f_size = 32;

        // registers
        std::vector<uint32_t> x;
        std::vector<uint32_t> f;
        uint32_t pc;
        RegRWTrace trace;

        // init
        Reg() : x(x_size, 0x0), f(f_size, 0x0), pc(0x0) {}

        // x
        uint32_t read_x(int index);
        int32_t read_x_signed(int index);
        void write_x(int index, uint32_t value);

        // f
        uint32_t read_f(int index);
        void write_f(int index, uint32_t value);

        // pc
        uint32_t read_pc();
        void write_pc(uint32_t value);
        void write_pc_relative(int32_t offset);
        void incr_pc();

        // util
        void dump();
};
