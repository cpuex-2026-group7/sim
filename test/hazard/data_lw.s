# [36] lw -> add_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t36
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t36:
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c36:

# [37] lw -> add_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t37
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t37:
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c37:

# [38] lw -> add_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t38
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t38:
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c38:

# [39] lw -> add_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t39
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t39:
    nop
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c39:

# [40] lw -> add_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t40
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t40:
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c40:

# [41] lw -> add_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t41
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t41:
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c41:

# [42] lw -> add_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t42
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t42:
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c42:

# [43] lw -> add_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t43
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t43:
    nop
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c43:

# [44] lw -> addi_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t44
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t44:
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c44:

# [45] lw -> addi_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t45
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t45:
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c45:

# [46] lw -> addi_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t46
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t46:
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c46:

# [47] lw -> addi_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t47
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t47:
    nop
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c47:

# [48] lw -> beq_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t48
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t48:
    beq x5, x7, c48
    halt
c48:

# [49] lw -> beq_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t49
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t49:
    nop
    beq x5, x7, c49
    halt
c49:

# [50] lw -> beq_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t50
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t50:
    nop
    nop
    beq x5, x7, c50
    halt
c50:

# [51] lw -> beq_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t51
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t51:
    nop
    nop
    nop
    beq x5, x7, c51
    halt
c51:

# [52] lw -> beq_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t52
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t52:
    beq x7, x5, c52
    halt
c52:

# [53] lw -> beq_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t53
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t53:
    nop
    beq x7, x5, c53
    halt
c53:

# [54] lw -> beq_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t54
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t54:
    nop
    nop
    beq x7, x5, c54
    halt
c54:

# [55] lw -> beq_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t55
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t55:
    nop
    nop
    nop
    beq x7, x5, c55
    halt
c55:

# [56] lw -> sw_data (distance=0)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t56
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t56:
    sw x5, 8001(x0)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c56:

# [57] lw -> sw_data (distance=1)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t57
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t57:
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
c57:

# [58] lw -> sw_data (distance=2)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t58
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t58:
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
c58:

# [59] lw -> sw_data (distance=3)
    addi x5, x0, fail
    addi x7, x0, 8001
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t59
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t59:
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
c59:

# [60] lw -> sw_base (distance=0)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t60
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t60:
    sw x13, 0(x5)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c60:

# [61] lw -> sw_base (distance=1)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t61
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t61:
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
c61:

# [62] lw -> sw_base (distance=2)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t62
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t62:
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
c62:

# [63] lw -> sw_base (distance=3)
    addi x5, x0, 8002
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t63
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t63:
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
c63:

# [64] lw -> lw_base (distance=0)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t64
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t64:
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c64:

# [65] lw -> lw_base (distance=1)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t65
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t65:
    nop
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c65:

# [66] lw -> lw_base (distance=2)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t66
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t66:
    nop
    nop
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c66:

# [67] lw -> lw_base (distance=3)
    addi x5, x0, fail
    addi x7, x0, 4660
    addi x13, x0, 4660
    addi x14, x0, 8001
    addi x12, x0, t67
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x13, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t67:
    nop
    nop
    nop
    lw x6, 0(x5)
    nop
    nop
    nop
    bne x6, x7, fail
c67:

# [68] lw -> jalr_base (distance=0)
    addi x5, x0, fail
    addi x7, x0, c68
    addi x13, x0, 4660
    addi x14, x0, c68
    addi x12, x0, t68
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t68:
    jalr x0, x5, 0
    halt
c68:

# [69] lw -> jalr_base (distance=1)
    addi x5, x0, fail
    addi x7, x0, c69
    addi x13, x0, 4660
    addi x14, x0, c69
    addi x12, x0, t69
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t69:
    nop
    jalr x0, x5, 0
    halt
c69:

# [70] lw -> jalr_base (distance=2)
    addi x5, x0, fail
    addi x7, x0, c70
    addi x13, x0, 4660
    addi x14, x0, c70
    addi x12, x0, t70
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t70:
    nop
    nop
    jalr x0, x5, 0
    halt
c70:

# [71] lw -> jalr_base (distance=3)
    addi x5, x0, fail
    addi x7, x0, c71
    addi x13, x0, 4660
    addi x14, x0, c71
    addi x12, x0, t71
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    lw x5, 8000(x0)
t71:
    nop
    nop
    nop
    jalr x0, x5, 0
    halt
c71:

pass:
    addi x31, x0, 1
    halt
fail:
    halt
