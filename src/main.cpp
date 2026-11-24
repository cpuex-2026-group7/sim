#include <string>
#include <getopt.h>
#include "core.h"

using namespace std;

int main(int argc, char *argv[]){
    // define args
    static const option opts[] = {
        {"trace", required_argument, nullptr, 't'},
        {"in", required_argument, nullptr, 'i'},    
        {"out", required_argument, nullptr, 'o'},
        {"boot", no_argument, nullptr, 'b'},
        {"cache-stats", no_argument, nullptr, 'c'},
        {"cache-ways", required_argument, nullptr, 'w'},
        {"cache-sets", required_argument, nullptr, 's'},
        {"cache-line", required_argument, nullptr, 'l'},
        {"branch-stats", no_argument, nullptr, 'p'},
        {nullptr, 0, nullptr, 0}
    };

    // parse args
    string trace_path = "";
    string in_path = "";
    string out_path = "";
    bool boot = false;
    bool cache_stats = false;
    bool branch_stats = false;
    DCache::Config cc;
    int opt;
    while ((opt = getopt_long(argc, argv,"t:i:o:bcpw:s:l:", opts, nullptr)) != -1) {
        switch (opt) {
            case 't': trace_path = optarg; break;
            case 'i': in_path = optarg; break;
            case 'o': out_path = optarg; break;
            case 'b': boot = true; break;
            case 'c': cache_stats = true; break;
            case 'p': branch_stats = true; break;
            case 'w': cc.ways = strtoul(optarg, nullptr, 0); break;
            case 's': cc.sets = strtoul(optarg, nullptr, 0); break;
            case 'l': cc.line_words = strtoul(optarg, nullptr, 0); break;
            default: fprintf(stderr, "Usage: %s <path_to_binary> [--trace <path>] [--in <path>] [--out <path>] [--boot] [--cache-stats] [--branch-stats] [--cache-ways N] [--cache-sets N] [--cache-line WORDS]\n", argv[0]); return 1;
        }
    }
    int n_args = argc - optind;
    if (n_args != (boot ? 0 : 1)){ fprintf(stderr, "Usage: %s <path_to_binary> [--trace <path>] [--in <path>] [--out <path>] [--boot] [--cache-stats] [--branch-stats] [--cache-ways N] [--cache-sets N] [--cache-line WORDS]\n", argv[0]); return 1; }
    string path = boot ? "" : argv[optind];

    // start
    Core core = Core(trace_path, in_path, out_path, cc);
    if (boot){
        core.boot();
    } else {
        core.load_exec(path);
        core.load_input();
    }
    core.cache_stats = cache_stats;
    core.branch_stats = branch_stats;
    core.run();
    return 0;
}