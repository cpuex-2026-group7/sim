#include <cmath>

#include "inst.h"
#include "const.h"
#include "util.h"


Inst::Inst(uint32_t raw) : raw(raw), imm(0) {
    decode();
}

void Inst::decode(){
    // parse type
    unit_type = get_bits(raw, 31, 31);
    eff_type = get_bits(raw, 29, 30);
    imm_type = get_bits(raw, 27, 28);
    op_id = get_bits(raw, 25, 26);  

    // get reg
    rd = get_bits(raw, 20, 24);
    rs1 = get_bits(raw, 15, 19);
    rs2 = get_bits(raw, 10, 14);

    // build imm
    switch (imm_type){
        case IMM_A: 
            // {instr[19:0], 12'b0}
            set_bits(imm, 12, 31, get_bits(raw, 0, 19));
            break;
        case IMM_B:
            // {{12{instr[19]}}, instr[19:0]}
            if (get_bits(raw, 19, 19) == 1) set_bits(imm, 20, 31, 0xFFF);
            set_bits(imm, 0, 19, get_bits(raw, 0, 19));
            break;
        case IMM_C:
            // {{17{instr[14]}}, instr[14:0]
            if (get_bits(raw, 14, 14) == 1) set_bits(imm, 15, 31, 0x1FFFF);
            set_bits(imm, 0, 14, get_bits(raw, 0, 14));
            break;
        case IMM_D:
            // {{17{instr[24]}}, instr[24:20], instr[9:0]}
            if (get_bits(raw, 24, 24) == 1) set_bits(imm, 15, 31, 0x1FFFF);
            set_bits(imm, 10, 14, get_bits(raw, 20, 24));
            set_bits(imm, 0, 9, get_bits(raw, 0, 9));
            break;
    }
}

bool Inst::exec(Reg &reg, Mem &mem){
    // execute instrutions
    bool jumped = false;
    switch (unit_type){
        case UNIT_ALU: 
            switch (eff_type){
                case EFF_NONE:
                    switch (imm_type){
                        case IMM_A:
                            switch (op_id){
                                case 0: // nop
                                    /* nop */
                                    break;
                            }
                            break;
                        case IMM_B:
                            break;
                        case IMM_C:
                            break;
                        case IMM_D:
                            switch (op_id){
                                case 0: // beq rs1, rs2, imm
                                    /* if rs1 == rs2, jump to imm */
                                    if (reg.read_x(rs1) == reg.read_x(rs2)){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                                case 1: // bne rs1, rs2, imm
                                    /* if rs1 != rs2, jump to imm */
                                    if (reg.read_x(rs1) != reg.read_x(rs2)){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                                case 2: // blt rs1, rs2, imm
                                    /* if rs1 < rs2, jump to imm */
                                    if (reg.read_x_signed(rs1) < reg.read_x_signed(rs2)){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                                case 3: // bge rs1, rs2, imm
                                    /* if rs1 >= rs2, jump to imm */
                                    if (reg.read_x_signed(rs1) >= reg.read_x_signed(rs2)){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                            }
                            break;
                    }
                    break;
                case EFF_WI:
                    switch (imm_type){
                        case IMM_A:
                            break;
                        case IMM_B:
                            switch (op_id){
                                case 0: // jal rd, imm
                                    /* jump to imm, store ret addr to rd */
                                    reg.write_x(rd, reg.read_pc() + 1);
                                    reg.write_pc_relative(imm);
                                    jumped = true;
                                    break;
                            }
                            break;
                        case IMM_C:
                            switch (op_id){
                                case 0: {// jalr rd, rs1, imm
                                    /* jump to rs1+imm, store ret addr to rd */
                                    uint32_t ret = reg.read_pc() + 1;
                                    reg.write_pc(reg.read_x(rs1) + imm);
                                    reg.write_x(rd, ret);
                                    jumped = true;
                                    break;
                                }
                                case 1: // addi rd rs1 imm
                                    /* rd = rs1 + imm */
                                    reg.write_x(rd, reg.read_x(rs1) + imm);
                                    break;
                                case 2: // lw rd, rs1, imm
                                    /* rd = mem[rs1+imm] */
                                    reg.write_x(rd, mem.read_data(reg.read_x(rs1) + imm));
                                    break;
                                case 3: { // sra rd, rs1, shift
                                    /* rd = rs1 >>a shift (下位6bit符号付き, 負なら左シフト) */
                                    int32_t sh = (int32_t)(imm & 0x3F);
                                    if (sh >= 32) sh -= 64;
                                    int32_t v = (int32_t)reg.read_x(rs1);
                                    if (sh >= 0) reg.write_x(rd, (uint32_t)(v >> sh));
                                    else reg.write_x(rd, sh == -32 ? 0u : (uint32_t)v << (-sh));
                                    break;
                                }
                            }
                            break;
                        case IMM_D:
                            switch (op_id){
                                case 0: // add rd, rs1, rs2
                                    /* rd = rs1 + rs2 */ // NOTE: unsignedで良い
                                    reg.write_x(rd, reg.read_x(rs1) + reg.read_x(rs2));
                                    break;
                                case 1: // sub rd, rs1, rs2
                                    /* rd = rs1 - rs2 */
                                    reg.write_x(rd, reg.read_x(rs1) - reg.read_x(rs2));
                                    break;
                            }
                            break;
                    }
                    break;
                case EFF_WF:
                    switch (imm_type){
                        case IMM_A:
                            break;
                        case IMM_B:
                            break;
                        case IMM_C:
                            switch (op_id){
                                case 0: // flw rd, rs1, imm
                                    /* rd(f) = mem[rs1+imm] */
                                    reg.write_f(rd, mem.read_data(reg.read_x(rs1) + imm));
                                    break;
                            }
                            break;
                        case IMM_D:
                            break;
                    }
                    break;
                case EFF_MEM:
                     switch (imm_type){
                        case IMM_A:
                            break;
                        case IMM_B:
                            break;
                        case IMM_C:
                            break;
                        case IMM_D:
                            switch (op_id){
                                case 0: // sw rs1, rs2, imm
                                    /* mem[rs1+imm] = rs2 */
                                    mem.write_data(reg.read_x(rs1) + imm, reg.read_x(rs2));
                                    break;
                                case 1: // fsw rs1, rs2, imm
                                    /* mem[rs1+imm] = rs2(f) */
                                    mem.write_data(reg.read_x(rs1) + imm, reg.read_f(rs2));
                            }
                            break;
                    }
                    break;
            }
            break;
        case UNIT_FPU: // TODO: emulate hardware FPU eventually
            switch (eff_type){
                case EFF_NONE:
                    switch (imm_type){
                        case IMM_A:
                            break;
                        case IMM_B:
                            break;
                        case IMM_C:
                            break;
                        case IMM_D:
                            switch (op_id){
                                case 0: // fbeq rs1(f), rs2(f), imm
                                    /* if rs1(f) == rs2(f), jump to imm */
                                    if (to_float(reg.read_f(rs1)) == to_float(reg.read_f(rs2))){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                                case 1: // fbne rs1(f), rs2(f), imm
                                    /* if rs1(f) != rs2(f), jump to imm */
                                    if (to_float(reg.read_f(rs1)) != to_float(reg.read_f(rs2))){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                                case 2: // fblt rs1(f), rs2(f), imm
                                    /* if rs1(f) < rs2(f), jump to imm */
                                    if (to_float(reg.read_f(rs1)) < to_float(reg.read_f(rs2))){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                                case 3: // fbge rs1(f), rs2(f), imm
                                    /* if rs1(f) >= rs2(f), jump to imm */
                                    if (to_float(reg.read_f(rs1)) >= to_float(reg.read_f(rs2))){
                                        reg.write_pc_relative(imm);
                                        jumped = true;
                                    }
                                    break;
                            }
                            break;
                    }
                    break;
                case EFF_WI:
                    switch (imm_type){
                        case IMM_A:
                            break;
                        case IMM_B:
                            break;
                        case IMM_C:
                            switch (op_id){
                                case 0: // ftoi  rd, rs1(f)
                                    /* rd = int(rs1(f)) */ // NOTE: 四捨五入
                                    reg.write_x(rd, (uint32_t)(int32_t)std::lround(to_float(reg.read_f(rs1))));
                                    break;
                            }
                            break;
                        case IMM_D:
                            switch (op_id){
                                case 0: // feq rd, rs1(f), rs2(f)
                                    /* rd = (rs1(f) == rs2(f)) */
                                    reg.write_x(rd, to_float(reg.read_f(rs1)) == to_float(reg.read_f(rs2)));
                                    break;
                                case 1: // flt rd, rs1(f), rs2(f)
                                    /* rd = (rs1(f) < rs2(f)) */
                                    reg.write_x(rd, to_float(reg.read_f(rs1)) < to_float(reg.read_f(rs2)));
                                    break;
                            }
                            break;
                    }
                    break;
                case EFF_WF:
                    switch (imm_type){
                        case IMM_A:
                            switch (op_id){
                                case 0: // fli rd(f), imm(f[31:12])
                                    /* rd(f) =  imm | 12'b0' */ 
                                    reg.write_f(rd, imm);
                                    break;
                            }
                            break;
                        case IMM_B:
                            switch (op_id){
                                case 0: // flhi rd(f), imm
                                    // TOOD: 小数をハードコードして、番号に対応するものを取得
                                    reg.write_f(rd, to_uint32(0.0f));
                                    break;
                            }
                            break;
                        case IMM_C:
                            switch (op_id){
                                case 0: // itof rd(f), rs1
                                    /* rd(f) = float(rs1) */
                                    reg.write_f(rd, to_uint32((float)(int32_t)reg.read_x(rs1)));
                                    break;
                                case 1: { // fcsign rd(f), rs1(f), flag (fmv = flag 0)
                                    /* rd(f) = {sign, rs1(f)[30:0]}, sign = (rs1.sign & ~flag[1]) ^ flag[0] */
                                    uint32_t v = reg.read_f(rs1);
                                    uint32_t sign = (((v >> 31) & ~(imm >> 1)) ^ imm) & 1;
                                    reg.write_f(rd, (sign << 31) | (v & 0x7FFFFFFFu));
                                    break;
                                }
                                case 2: // fsqrt rd(f), rs1(f)
                                    /* rd(f) = sqrt(rs1(f)) */
                                    reg.write_f(rd, to_uint32(std::sqrt(to_float(reg.read_f(rs1)))));
                                    break;
                                case 3: // fabs rd(f), rs1(f)
                                    /* rd(f) = abs(rs1(f)) */
                                    reg.write_f(rd, to_uint32(std::fabs(to_float(reg.read_f(rs1)))));
                                    break;
                            }
                            break;
                        case IMM_D:
                            switch (op_id){
                                case 0: // fadd rd(f), rs1(f), rs2(f)
                                    /* rd(f) = rs1(f) + rs2(f) */
                                    reg.write_f(rd, to_uint32(to_float(reg.read_f(rs1)) + to_float(reg.read_f(rs2))));
                                    break;
                                case 1: // fsub rd(f), rs1(f), rs2(f)
                                    /* rd(f) = rs1(f) - rs2(f) */
                                    reg.write_f(rd, to_uint32(to_float(reg.read_f(rs1)) - to_float(reg.read_f(rs2))));
                                    break;
                                case 2: // fmul rd(f), rs1(f), rs2(f)
                                    /* rd(f) = rs1(f) * rs2(f) */
                                    reg.write_f(rd, to_uint32(to_float(reg.read_f(rs1)) * to_float(reg.read_f(rs2))));
                                    break;
                                case 3: // fdiv rd(f), rs1(f), rs2(f)
                                    /* rd(f) = rs1(f) / rs2(f) */
                                    reg.write_f(rd, to_uint32(to_float(reg.read_f(rs1)) / to_float(reg.read_f(rs2))));
                                    break;  
                            }
                            break;
                    }
                    break;
                case EFF_MEM:
                    switch (imm_type){
                        case IMM_A:
                            break;
                        case IMM_B:
                            break;
                        case IMM_C:
                            break;
                        case IMM_D:
                            switch (op_id){
                                case 0:
                                    break;
                                case 1:
                                    break;
                                case 2:
                                    break;
                                case 3: // halt
                                    /* stop */
                                    return false;
                            }
                    }
                    break;
            }
            break;
    }
    // TODO: calc timing?
    // incr pc if not jumped
    if (!jumped) reg.incr_pc();
    return true;
}
