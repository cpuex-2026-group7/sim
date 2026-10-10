#include <string>
#include "core.h"

using namespace std;

int main(int argc, char *argv[]){
    // parse args
    if (argc < 2){
        printf("Usage: %s <path_to_binary> [--trace <path>]\n", argv[0]);
        return 1;
    }
    string path = argv[1];
    string trace_path = "";
    if (argc >= 4 && string(argv[2]) == "--trace"){
        trace_path = argv[3];
    }

    // start
    Core core = Core(path, trace_path);
    core.run();
    return 0;
}