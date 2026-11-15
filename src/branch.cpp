#include "branch.h"

using Type = BranchPredictor::Type;

BranchPredictor::BranchPredictor() : btb(entries) {}

void BranchPredictor::update(uint32_t pc, bool valid, uint32_t target){
    Entry &e = btb[index_of(pc)];
    e.valid = valid;
    e.tag = tag_of(pc);
    e.target = target;
}

BranchPredictor::Result BranchPredictor::step(uint32_t pc, Type type, uint32_t static_tgt, uint32_t actual_next){
    /*
     statig_tgt: target PC from frontend decoder (br/jal/jalr)
     actual_next: real next PC from backend (br/jal/jalr)
    */
    Result r;
    const uint32_t pc_mask = (pc_bits >= 32) ? 0xFFFFFFFFu : ((1u << pc_bits) - 1); // up to 32bit
    pc &= pc_mask; 
    static_tgt &= pc_mask; 
    actual_next &= pc_mask;
    const uint32_t seq = (pc + 1) & pc_mask; // PC + 1
    const int ti = static_cast<int>(type);

    // record stats
    stats.insts++;
    if (type == Type::Branch){ stats.branch++; if (actual_next == static_tgt) stats.branch_taken++; }
    if (type == Type::Jal) stats.jal++;
    if (type == Type::Jalr) stats.jalr++;

    // BTB lookup
    const Entry &e = btb[index_of(pc)];
    const bool hit = e.valid && e.tag == tag_of(pc);
    if (hit) stats.btb_hit++;
    uint32_t pred_next = hit ? e.target : seq;

    // F3 redirect : frontend BTB based prediction -> decoded next PC 
    const bool bpd_taken = true; // NOTE: branch prediction is always taken for now
    const uint32_t dec_target = (type == Type::None || type == Type::Jalr) ? seq : static_tgt;
    bool redirect;
    if (type == Type::None) redirect = hit; // non-branch: should be seq ... if hit, fix it to seq
    else if (type == Type::Jalr) redirect = false; // jalr: no idea about the target at frontend (might redirect at backend)
    else redirect = (hit != bpd_taken) || (hit && dec_target != e.target); // jal: 
    if (redirect){
        r.f3_redirect = true;
        stats.f3_redirect[ti]++;
        pred_next = dec_target;
        update(pc, type != Type::None, dec_target);
    }

    // Backend redirect: frontend next PC -> backend actual next PC
    if (pred_next != actual_next){
        r.mispredict = true;
        stats.mispredict[ti]++;
        update(pc, true, actual_next);
    }
    return r;
}

void BranchPredictor::print_stats(FILE *out) const {
    uint64_t br_total = stats.branch + stats.jal + stats.jalr;
    uint64_t mp = stats.mispredict[1] + stats.mispredict[2] + stats.mispredict[3] + stats.mispredict[0];
    uint64_t f3 = stats.f3_redirect[1] + stats.f3_redirect[2] + stats.f3_redirect[3] + stats.f3_redirect[0];
    fprintf(out, "=== Branch Predictor Stats ===\n");
    fprintf(out, "instructions: %llu, branch/jump: %llu (branch %llu [taken %llu], jal %llu, jalr %llu)\n",
            (unsigned long long)stats.insts, (unsigned long long)br_total,
            (unsigned long long)stats.branch, (unsigned long long)stats.branch_taken,
            (unsigned long long)stats.jal, (unsigned long long)stats.jalr);
    fprintf(out, "F3 redirect: %llu  [branch %llu, jal %llu, jalr %llu, non-branch(BTB alias) %llu]\n",
            (unsigned long long)f3,
            (unsigned long long)stats.f3_redirect[1], (unsigned long long)stats.f3_redirect[2],
            (unsigned long long)stats.f3_redirect[3], (unsigned long long)stats.f3_redirect[0]);
    fprintf(out, "backend mispredict: %llu (%.2f%% of branch/jump)  [branch %llu, jal %llu, jalr %llu, other %llu]\n",
            (unsigned long long)mp, br_total ? 100.0 * mp / br_total : 0.0,
            (unsigned long long)stats.mispredict[1], (unsigned long long)stats.mispredict[2],
            (unsigned long long)stats.mispredict[3], (unsigned long long)stats.mispredict[0]);
}
