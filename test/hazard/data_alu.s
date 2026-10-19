# [0] alu -> add_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t0
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t0:
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c0:

# [1] alu -> add_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t1
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t1:
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c1:

# [2] alu -> add_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t2
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t2:
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c2:

# [3] alu -> add_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t3
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t3:
    nop
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c3:

# [4] alu -> add_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t4
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t4:
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c4:

# [5] alu -> add_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t5
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t5:
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c5:

# [6] alu -> add_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t6
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t6:
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c6:

# [7] alu -> add_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t7
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t7:
    nop
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c7:

# [8] alu -> addi_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t8
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t8:
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c8:

# [9] alu -> addi_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t9
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t9:
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c9:

# [10] alu -> addi_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t10
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t10:
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c10:

# [11] alu -> addi_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t11
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t11:
    nop
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c11:

# [12] alu -> beq_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t12
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t12:
    beq x5, x7, c12
    halt
c12:

# [13] alu -> beq_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t13
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t13:
    nop
    beq x5, x7, c13
    halt
c13:

# [14] alu -> beq_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t14
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t14:
    nop
    nop
    beq x5, x7, c14
    halt
c14:

# [15] alu -> beq_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t15
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t15:
    nop
    nop
    nop
    beq x5, x7, c15
    halt
c15:

# [16] alu -> beq_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t16
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t16:
    beq x7, x5, c16
    halt
c16:

# [17] alu -> beq_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t17
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t17:
    nop
    beq x7, x5, c17
    halt
c17:

# [18] alu -> beq_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t18
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t18:
    nop
    nop
    beq x7, x5, c18
    halt
c18:

# [19] alu -> beq_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t19
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t19:
    nop
    nop
    nop
    beq x7, x5, c19
    halt
c19:

# [20] alu -> sw_data (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t20
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t20:
    sw x5, 8001(x0)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c20:

# [21] alu -> sw_data (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t21
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t21:
    nop
    sw x5, 8001(x0)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c21:

# [22] alu -> sw_data (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t22
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t22:
    nop
    nop
    sw x5, 8001(x0)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c22:

# [23] alu -> sw_data (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t23
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t23:
    nop
    nop
    nop
    sw x5, 8001(x0)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c23:

# [24] alu -> sw_base (distance=0)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t24
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t24:
    sw x13, 0(x5)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c24:

# [25] alu -> sw_base (distance=1)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t25
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t25:
    nop
    sw x13, 0(x5)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c25:

# [26] alu -> sw_base (distance=2)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t26
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t26:
    nop
    nop
    sw x13, 0(x5)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c26:

# [27] alu -> sw_base (distance=3)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t27
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t27:
    nop
    nop
    nop
    sw x13, 0(x5)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c27:

# [28] alu -> lw_base (distance=0)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t28
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t28:
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c28:

# [29] alu -> lw_base (distance=1)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t29
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t29:
    nop
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c29:

# [30] alu -> lw_base (distance=2)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t30
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t30:
    nop
    nop
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c30:

# [31] alu -> lw_base (distance=3)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t31
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t31:
    nop
    nop
    nop
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c31:

# [32] alu -> jalr_base (distance=0)
    addi x5, x0, fail
    addi x7, x0, c32
    addi x13, x0, 4660
    addi x14, x0, c32
    addi x12, x0, t32
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t32:
    jalr x0, x5, 0
    halt
c32:

# [33] alu -> jalr_base (distance=1)
    addi x5, x0, fail
    addi x7, x0, c33
    addi x13, x0, 4660
    addi x14, x0, c33
    addi x12, x0, t33
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t33:
    nop
    jalr x0, x5, 0
    halt
c33:

# [34] alu -> jalr_base (distance=2)
    addi x5, x0, fail
    addi x7, x0, c34
    addi x13, x0, 4660
    addi x14, x0, c34
    addi x12, x0, t34
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t34:
    nop
    nop
    jalr x0, x5, 0
    halt
c34:

# [35] alu -> jalr_base (distance=3)
    addi x5, x0, fail
    addi x7, x0, c35
    addi x13, x0, 4660
    addi x14, x0, c35
    addi x12, x0, t35
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    add x5, x14, x0
t35:
    nop
    nop
    nop
    jalr x0, x5, 0
    halt
c35:

pass:
    addi x31, x0, 1
    halt
fail:
    halt
