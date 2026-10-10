#include "reg.h"
#include "util.h"
#include <cstdio>

// x
uint32_t Reg::read_x(int index){
    return x[index];
}
int32_t Reg::read_x_signed(int index){
    return static_cast<int32_t>(x[index]);
}
void Reg::write_x(int index, uint32_t value){
    trace = {true, false, index, value};
    x[index] = index ? value : 0x0;
}

// f
uint32_t Reg::read_f(int index){
    return f[index];
}
void Reg::write_f(int index, uint32_t value){
    trace = {true, true, index, value};
    f[index] = index ? value : to_uint32(0.0f);
}

// pc
uint32_t Reg::read_pc(){
    return pc;
}
void Reg::write_pc(uint32_t value){
    pc = value;
}
void Reg::write_pc_relative(int32_t offset){
    pc += offset;
}
void Reg::incr_pc(){
    pc++;
}

// util
void Reg::dump(){
    printf("=== Reg Dump ===\n");
    printf("pc = %u\n", pc);
    printf("=== x regs ===\n");
    for (int i = 0; i < x_size; i++){
        printf("x[%02d] = 0x%08x %12d | ", i, x[i], (int32_t)x[i]);
        if (i % 4 == 3) printf("\n");
    }
    printf("=== f regs ===\n");
    for (int i = 0; i < f_size; i++){
        printf("f[%02d] = 0x%08x %12g | ", i, f[i], to_float(f[i]));
        if (i % 4 == 3) printf("\n");
    }
}
