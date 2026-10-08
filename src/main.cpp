#include <string>
#include "core.h"

using namespace std;

int main(int argc, char *argv[]){
    // parse args
    if (argc != 2){
        printf("Usage: %s <path_to_binary>\n", argv[0]);
        return 1;
    }
    string path = argv[1];

    // start
    Core core = Core(path);
    core.run();
    return 0;
}