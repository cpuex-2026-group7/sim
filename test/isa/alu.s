# ISA operation test (ALU)

# NOTE:
# order is based on the dependency of the inst
# if test fails, it will halt with x31 = 0, otherwise x31 = 1

test_addi:
    # nop
    nop
    # addi
    addi x1, x0, 1 # prepare constants for later tests
    addi x2, x0, 1
    addi x3, x0, 2
    addi x4, x0, 3
    addi x5, x0, 600
    addi x6, x0, 1000
    addi x7, x0, -300
    nop

test_beq:
    beq x1, x2, l1 # true
    halt
l1:
    beq x1, x3, fail # false
    nop

test_bne:
    bne x1, x3, l2
    halt
l2:
    bne x1, x2, fail
    nop

test_blt:
    blt x1, x3, l3 # true
    halt
l3:
    blt x3, x1, fail # false
    blt x1, x2, fail # border
    blt x7, x1, l4 # negative
    halt
l4:
    blt x1, x7, fail
    bge x1, x7, test_bge
    halt

test_bge:
    bge x3, x1, l5
    halt
l5:
    bge x1, x3, fail
    bge x1, x2, l6
    halt
l6:
    bge x1, x2, test_jal
    halt

test_jal:
    jal x10, cont_jal
ret_jal:
    halt
cont_jal:
    addi x12, x0, ret_jal
    nop
    nop
    nop
    bne x10, x12, fail

test_jalr:
    addi x11, x0, 0
    jalr x10, x0, l7
    beq x11, x0, fail # check if it jumped to l7 (reuse)
    jal x0, test_add # jump to next test

l7:
    addi x11, x0, 1
    nop
    nop
    jalr x0, x10, 0 # jump back

test_add:
    add x10, x1, x2
    nop
    nop
    nop
    bne x10, x3, fail

test_sub:
    sub x10, x3, x2
    nop
    nop
    nop
    bne x10, x1, fail

test_mem:
    # basic
    sw x6, 0(x5)
    nop
    nop
    nop
    lw x10, 0(x5)
    nop
    nop
    nop
    bne x6, x10, fail
    # negative offset
    sw x7, -5(x5) # 600 - 5 = 595
    nop
    nop
    nop
    lw x13, 595(x0)
    nop
    nop
    nop
    bne x13, x7, fail
    # positive offset 
    sw x4, 10(x5)
    nop
    nop
    nop
    lw x14, 610(x0)
    nop
    nop
    nop
    bne x14, x4, fail
    # edge check
    lw x15, 0(x5)
    nop
    nop
    nop
    bne x15, x6, fail
    # overwrite
    sw x7, 0(x5)
    nop
    nop
    nop
    lw x16, 0(x5)
    nop
    nop
    nop
    bne x16, x7, fail
    # sw x0 stores 0
    sw x0, 0(x5)
    nop
    nop
    nop
    lw x17, 0(x5)
    nop
    nop
    nop
    bne x17, x0, fail

test_x0:
    sub x10, x1, x1
    addi x0, x0, 1
    nop
    nop
    nop
    bne x0, x10, fail

pass:
    addi x31, x0, 1
    halt
fail:
    halt
