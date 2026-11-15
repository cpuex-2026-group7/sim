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
        {nullptr, 0, nullptr, 0}
    };

    // parse args
    string trace_path = "";
    string in_path = "";
    string out_path = "";
    bool boot = false;
    bool cache_stats = false;
    int opt;
    while ((opt = getopt_long(argc, argv,"t:i:o:bc", opts, nullptr)) != -1) {
        switch (opt) {
            case 't': trace_path = optarg; break;
            case 'i': in_path = optarg; break;
            case 'o': out_path = optarg; break;
            case 'b': boot = true; break;
            case 'c': cache_stats = true; break;
            default: fprintf(stderr, "Usage: %s <path_to_binary> [--trace <path>] [--in <path>] [--out <path>] [--boot] [--cache-stats]\n", argv[0]); return 1;
        }
    }
    int n_args = argc - optind;
    if (n_args != (boot ? 0 : 1)){ fprintf(stderr, "Usage: %s <path_to_binary> [--trace <path>] [--in <path>] [--out <path>] [--boot] [--cache-stats]\n", argv[0]); return 1; }
    string path = boot ? "" : argv[optind];

    // start
    Core core = Core(trace_path, in_path, out_path);
    if (boot){
        core.boot();
    } else {
        core.load_exec(path);
    }
    core.cache_stats = cache_stats;
    core.run();
    return 0;
}