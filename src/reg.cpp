#include "reg.h"
#include "util.h"


// x
uint32_t Reg::read_x(int index){
    return x[index];
}
void Reg::write_x(int index, uint32_t value){
    x[index] = index ? value : 0x0;
}

// f
uint32_t Reg::read_f(int index){
    return f[index];
}
void Reg::write_f(int index, uint32_t value){
    f[index] = index ? value : to_uint32(0.0f);
}

// pc
uint32_t Reg::read_pc(){
    return pc;
}
void Reg::write_pc(uint32_t value){
    pc = value;
}
void Reg::incr_pc(){
    pc++;
}