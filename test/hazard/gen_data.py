import os

MAGIC = 0x1234
NOP3 = ["nop", "nop", "nop"]

FILES = {"data_alu.s": ["alu"], "data_lw.s": ["lw"], "data_jump.s": ["jal", "jalr"]}
PRODUCERS = {
    "alu": "add x5, x14, x0", 
    "lw": f"lw x5, 8000(x0)",
    "jal": "jal x5, t{i}", 
    "jalr": "jalr x5, x12, 0"
}
CONSUMERS = {
    "add_rs1": ["add x6, x5, x0", *NOP3, "bne x6, x7, fail"],
    "add_rs2": ["add x6, x0, x5", *NOP3, "bne x6, x7, fail"],
    "addi_rs1":["addi x6, x5, 0", *NOP3, "bne x6, x7, fail"],
    "beq_rs1": ["beq x5, x7, c{i}", "halt"],
    "beq_rs2": ["beq x7, x5, c{i}", "halt"],
    "sw_data": ["sw x5, 8001(x0)", *NOP3, f"lw x6, 8001(x0)", *NOP3, "bne x6, x7, fail"],
    "sw_base": ["sw x13, 0(x5)", *NOP3, f"lw x6, 8001(x0)", *NOP3, "bne x6, x7, fail"],
    "lw_base": ["lw x6, 0(x5)", *NOP3, "bne x6, x7, fail"],
    "jalr_base": ["jalr x0, x5, 0", "halt"],
}


def pattern(i, prod, cons, dist):
    jump = prod in ("jal", "jalr")
    new = f"r{i}" if jump else f"c{i}" if cons == "jalr_base" else 8001
    expect = MAGIC if cons in ("sw_base", "lw_base") else new
    old = 8002 if cons == "sw_base" else "fail"
    lines = [
        f"# [{i}] {prod} -> {cons} (distance={dist})",
        f"addi x5, x0, {old}", 
        f"addi x7, x0, {expect}", 
        f"addi x13, x0, {MAGIC}",
        f"addi x14, x0, {new}", 
        f"addi x12, x0, t{i}",  # jalr 
        *NOP3,
        f"sw x14, 8000(x0)", 
        f"sw {'x13' if cons == 'lw_base' else 'x0'}, 8001(x0)", # lw
        *NOP3,
        PRODUCERS[prod]
    ]
    if jump:  
        lines += [f"r{i}:", f"jal x0, c{i}"]
    lines += [f"t{i}:", *["nop"] * dist, *CONSUMERS[cons], f"c{i}:"]
    return [l if l.endswith(":") or l.startswith("#") else "    " + l.format(i=i) for l in lines]


def main():
    outdir = os.path.dirname(os.path.abspath(__file__))
    i = 0
    for name, prods in FILES.items():
        body = []
        for prod in prods:
            for cons in CONSUMERS:
                if prod in ("jal", "jalr") and cons in ("sw_base", "lw_base"):
                    continue  # skip instruction mem
                for dist in range(4):
                    body += pattern(i, prod, cons, dist) + [""]
                    i += 1
        body += ["pass:", "    addi x31, x0, 1", "    halt", "fail:", "    halt", ""]
        with open(os.path.join(outdir, name), "w") as f:
            f.write("\n".join(body))
    print(f"{i} patterns")


if __name__ == "__main__":
    main()
