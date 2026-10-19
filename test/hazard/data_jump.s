# [72] jal -> add_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r72
    addi x13, x0, 4660
    addi x14, x0, r72
    addi x12, x0, t72
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t72
r72:
    jal x0, c72
t72:
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c72:

# [73] jal -> add_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r73
    addi x13, x0, 4660
    addi x14, x0, r73
    addi x12, x0, t73
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t73
r73:
    jal x0, c73
t73:
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c73:

# [74] jal -> add_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r74
    addi x13, x0, 4660
    addi x14, x0, r74
    addi x12, x0, t74
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t74
r74:
    jal x0, c74
t74:
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c74:

# [75] jal -> add_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r75
    addi x13, x0, 4660
    addi x14, x0, r75
    addi x12, x0, t75
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t75
r75:
    jal x0, c75
t75:
    nop
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c75:

# [76] jal -> add_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r76
    addi x13, x0, 4660
    addi x14, x0, r76
    addi x12, x0, t76
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t76
r76:
    jal x0, c76
t76:
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c76:

# [77] jal -> add_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r77
    addi x13, x0, 4660
    addi x14, x0, r77
    addi x12, x0, t77
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t77
r77:
    jal x0, c77
t77:
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c77:

# [78] jal -> add_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r78
    addi x13, x0, 4660
    addi x14, x0, r78
    addi x12, x0, t78
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t78
r78:
    jal x0, c78
t78:
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c78:

# [79] jal -> add_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r79
    addi x13, x0, 4660
    addi x14, x0, r79
    addi x12, x0, t79
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t79
r79:
    jal x0, c79
t79:
    nop
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c79:

# [80] jal -> addi_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r80
    addi x13, x0, 4660
    addi x14, x0, r80
    addi x12, x0, t80
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t80
r80:
    jal x0, c80
t80:
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c80:

# [81] jal -> addi_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r81
    addi x13, x0, 4660
    addi x14, x0, r81
    addi x12, x0, t81
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t81
r81:
    jal x0, c81
t81:
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c81:

# [82] jal -> addi_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r82
    addi x13, x0, 4660
    addi x14, x0, r82
    addi x12, x0, t82
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t82
r82:
    jal x0, c82
t82:
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c82:

# [83] jal -> addi_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r83
    addi x13, x0, 4660
    addi x14, x0, r83
    addi x12, x0, t83
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t83
r83:
    jal x0, c83
t83:
    nop
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c83:

# [84] jal -> beq_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r84
    addi x13, x0, 4660
    addi x14, x0, r84
    addi x12, x0, t84
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t84
r84:
    jal x0, c84
t84:
    beq x5, x7, c84
    halt
c84:

# [85] jal -> beq_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r85
    addi x13, x0, 4660
    addi x14, x0, r85
    addi x12, x0, t85
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t85
r85:
    jal x0, c85
t85:
    nop
    beq x5, x7, c85
    halt
c85:

# [86] jal -> beq_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r86
    addi x13, x0, 4660
    addi x14, x0, r86
    addi x12, x0, t86
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t86
r86:
    jal x0, c86
t86:
    nop
    nop
    beq x5, x7, c86
    halt
c86:

# [87] jal -> beq_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r87
    addi x13, x0, 4660
    addi x14, x0, r87
    addi x12, x0, t87
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t87
r87:
    jal x0, c87
t87:
    nop
    nop
    nop
    beq x5, x7, c87
    halt
c87:

# [88] jal -> beq_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r88
    addi x13, x0, 4660
    addi x14, x0, r88
    addi x12, x0, t88
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t88
r88:
    jal x0, c88
t88:
    beq x7, x5, c88
    halt
c88:

# [89] jal -> beq_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r89
    addi x13, x0, 4660
    addi x14, x0, r89
    addi x12, x0, t89
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t89
r89:
    jal x0, c89
t89:
    nop
    beq x7, x5, c89
    halt
c89:

# [90] jal -> beq_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r90
    addi x13, x0, 4660
    addi x14, x0, r90
    addi x12, x0, t90
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t90
r90:
    jal x0, c90
t90:
    nop
    nop
    beq x7, x5, c90
    halt
c90:

# [91] jal -> beq_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r91
    addi x13, x0, 4660
    addi x14, x0, r91
    addi x12, x0, t91
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t91
r91:
    jal x0, c91
t91:
    nop
    nop
    nop
    beq x7, x5, c91
    halt
c91:

# [92] jal -> sw_data (distance=0)
    addi x5, x0, fail
    addi x7, x0, r92
    addi x13, x0, 4660
    addi x14, x0, r92
    addi x12, x0, t92
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t92
r92:
    jal x0, c92
t92:
    sw x5, 8001(x0)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c92:

# [93] jal -> sw_data (distance=1)
    addi x5, x0, fail
    addi x7, x0, r93
    addi x13, x0, 4660
    addi x14, x0, r93
    addi x12, x0, t93
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t93
r93:
    jal x0, c93
t93:
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
c93:

# [94] jal -> sw_data (distance=2)
    addi x5, x0, fail
    addi x7, x0, r94
    addi x13, x0, 4660
    addi x14, x0, r94
    addi x12, x0, t94
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t94
r94:
    jal x0, c94
t94:
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
c94:

# [95] jal -> sw_data (distance=3)
    addi x5, x0, fail
    addi x7, x0, r95
    addi x13, x0, 4660
    addi x14, x0, r95
    addi x12, x0, t95
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t95
r95:
    jal x0, c95
t95:
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
c95:

# [96] jal -> jalr_base (distance=0)
    addi x5, x0, fail
    addi x7, x0, r96
    addi x13, x0, 4660
    addi x14, x0, r96
    addi x12, x0, t96
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t96
r96:
    jal x0, c96
t96:
    jalr x0, x5, 0
    halt
c96:

# [97] jal -> jalr_base (distance=1)
    addi x5, x0, fail
    addi x7, x0, r97
    addi x13, x0, 4660
    addi x14, x0, r97
    addi x12, x0, t97
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t97
r97:
    jal x0, c97
t97:
    nop
    jalr x0, x5, 0
    halt
c97:

# [98] jal -> jalr_base (distance=2)
    addi x5, x0, fail
    addi x7, x0, r98
    addi x13, x0, 4660
    addi x14, x0, r98
    addi x12, x0, t98
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t98
r98:
    jal x0, c98
t98:
    nop
    nop
    jalr x0, x5, 0
    halt
c98:

# [99] jal -> jalr_base (distance=3)
    addi x5, x0, fail
    addi x7, x0, r99
    addi x13, x0, 4660
    addi x14, x0, r99
    addi x12, x0, t99
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jal x5, t99
r99:
    jal x0, c99
t99:
    nop
    nop
    nop
    jalr x0, x5, 0
    halt
c99:

# [100] jalr -> add_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r100
    addi x13, x0, 4660
    addi x14, x0, r100
    addi x12, x0, t100
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r100:
    jal x0, c100
t100:
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c100:

# [101] jalr -> add_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r101
    addi x13, x0, 4660
    addi x14, x0, r101
    addi x12, x0, t101
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r101:
    jal x0, c101
t101:
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c101:

# [102] jalr -> add_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r102
    addi x13, x0, 4660
    addi x14, x0, r102
    addi x12, x0, t102
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r102:
    jal x0, c102
t102:
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c102:

# [103] jalr -> add_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r103
    addi x13, x0, 4660
    addi x14, x0, r103
    addi x12, x0, t103
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r103:
    jal x0, c103
t103:
    nop
    nop
    nop
    add x6, x5, x0
    nop
    nop
    nop
    bne x6, x7, fail
c103:

# [104] jalr -> add_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r104
    addi x13, x0, 4660
    addi x14, x0, r104
    addi x12, x0, t104
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r104:
    jal x0, c104
t104:
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c104:

# [105] jalr -> add_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r105
    addi x13, x0, 4660
    addi x14, x0, r105
    addi x12, x0, t105
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r105:
    jal x0, c105
t105:
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c105:

# [106] jalr -> add_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r106
    addi x13, x0, 4660
    addi x14, x0, r106
    addi x12, x0, t106
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r106:
    jal x0, c106
t106:
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c106:

# [107] jalr -> add_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r107
    addi x13, x0, 4660
    addi x14, x0, r107
    addi x12, x0, t107
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r107:
    jal x0, c107
t107:
    nop
    nop
    nop
    add x6, x0, x5
    nop
    nop
    nop
    bne x6, x7, fail
c107:

# [108] jalr -> addi_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r108
    addi x13, x0, 4660
    addi x14, x0, r108
    addi x12, x0, t108
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r108:
    jal x0, c108
t108:
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c108:

# [109] jalr -> addi_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r109
    addi x13, x0, 4660
    addi x14, x0, r109
    addi x12, x0, t109
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r109:
    jal x0, c109
t109:
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c109:

# [110] jalr -> addi_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r110
    addi x13, x0, 4660
    addi x14, x0, r110
    addi x12, x0, t110
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r110:
    jal x0, c110
t110:
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c110:

# [111] jalr -> addi_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r111
    addi x13, x0, 4660
    addi x14, x0, r111
    addi x12, x0, t111
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r111:
    jal x0, c111
t111:
    nop
    nop
    nop
    addi x6, x5, 0
    nop
    nop
    nop
    bne x6, x7, fail
c111:

# [112] jalr -> beq_rs1 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r112
    addi x13, x0, 4660
    addi x14, x0, r112
    addi x12, x0, t112
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r112:
    jal x0, c112
t112:
    beq x5, x7, c112
    halt
c112:

# [113] jalr -> beq_rs1 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r113
    addi x13, x0, 4660
    addi x14, x0, r113
    addi x12, x0, t113
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r113:
    jal x0, c113
t113:
    nop
    beq x5, x7, c113
    halt
c113:

# [114] jalr -> beq_rs1 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r114
    addi x13, x0, 4660
    addi x14, x0, r114
    addi x12, x0, t114
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r114:
    jal x0, c114
t114:
    nop
    nop
    beq x5, x7, c114
    halt
c114:

# [115] jalr -> beq_rs1 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r115
    addi x13, x0, 4660
    addi x14, x0, r115
    addi x12, x0, t115
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r115:
    jal x0, c115
t115:
    nop
    nop
    nop
    beq x5, x7, c115
    halt
c115:

# [116] jalr -> beq_rs2 (distance=0)
    addi x5, x0, fail
    addi x7, x0, r116
    addi x13, x0, 4660
    addi x14, x0, r116
    addi x12, x0, t116
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r116:
    jal x0, c116
t116:
    beq x7, x5, c116
    halt
c116:

# [117] jalr -> beq_rs2 (distance=1)
    addi x5, x0, fail
    addi x7, x0, r117
    addi x13, x0, 4660
    addi x14, x0, r117
    addi x12, x0, t117
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r117:
    jal x0, c117
t117:
    nop
    beq x7, x5, c117
    halt
c117:

# [118] jalr -> beq_rs2 (distance=2)
    addi x5, x0, fail
    addi x7, x0, r118
    addi x13, x0, 4660
    addi x14, x0, r118
    addi x12, x0, t118
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r118:
    jal x0, c118
t118:
    nop
    nop
    beq x7, x5, c118
    halt
c118:

# [119] jalr -> beq_rs2 (distance=3)
    addi x5, x0, fail
    addi x7, x0, r119
    addi x13, x0, 4660
    addi x14, x0, r119
    addi x12, x0, t119
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r119:
    jal x0, c119
t119:
    nop
    nop
    nop
    beq x7, x5, c119
    halt
c119:

# [120] jalr -> sw_data (distance=0)
    addi x5, x0, fail
    addi x7, x0, r120
    addi x13, x0, 4660
    addi x14, x0, r120
    addi x12, x0, t120
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r120:
    jal x0, c120
t120:
    sw x5, 8001(x0)
    nop
    nop
    nop
    lw x6, 8001(x0)
    nop
    nop
    nop
    bne x6, x7, fail
c120:

# [121] jalr -> sw_data (distance=1)
    addi x5, x0, fail
    addi x7, x0, r121
    addi x13, x0, 4660
    addi x14, x0, r121
    addi x12, x0, t121
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r121:
    jal x0, c121
t121:
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
c121:

# [122] jalr -> sw_data (distance=2)
    addi x5, x0, fail
    addi x7, x0, r122
    addi x13, x0, 4660
    addi x14, x0, r122
    addi x12, x0, t122
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r122:
    jal x0, c122
t122:
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
c122:

# [123] jalr -> sw_data (distance=3)
    addi x5, x0, fail
    addi x7, x0, r123
    addi x13, x0, 4660
    addi x14, x0, r123
    addi x12, x0, t123
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r123:
    jal x0, c123
t123:
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
c123:

# [124] jalr -> jalr_base (distance=0)
    addi x5, x0, fail
    addi x7, x0, r124
    addi x13, x0, 4660
    addi x14, x0, r124
    addi x12, x0, t124
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r124:
    jal x0, c124
t124:
    jalr x0, x5, 0
    halt
c124:

# [125] jalr -> jalr_base (distance=1)
    addi x5, x0, fail
    addi x7, x0, r125
    addi x13, x0, 4660
    addi x14, x0, r125
    addi x12, x0, t125
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r125:
    jal x0, c125
t125:
    nop
    jalr x0, x5, 0
    halt
c125:

# [126] jalr -> jalr_base (distance=2)
    addi x5, x0, fail
    addi x7, x0, r126
    addi x13, x0, 4660
    addi x14, x0, r126
    addi x12, x0, t126
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r126:
    jal x0, c126
t126:
    nop
    nop
    jalr x0, x5, 0
    halt
c126:

# [127] jalr -> jalr_base (distance=3)
    addi x5, x0, fail
    addi x7, x0, r127
    addi x13, x0, 4660
    addi x14, x0, r127
    addi x12, x0, t127
    nop
    nop
    nop
    sw x14, 8000(x0)
    sw x0, 8001(x0)
    nop
    nop
    nop
    jalr x5, x12, 0
r127:
    jal x0, c127
t127:
    nop
    nop
    nop
    jalr x0, x5, 0
    halt
c127:

pass:
    addi x31, x0, 1
    halt
fail:
    halt
