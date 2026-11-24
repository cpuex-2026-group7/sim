# sim
Simulator written in C++

## Build
```bash
make
```

## Usage
```bash
./build/sim <path_to_binary> [--trace <path>] [--in <path>] [--out <path>] [--cache-stats] [--branch-stats] [--inst-stats] [--cache-ways N] [--cache-sets N] [--cache-line WORDS]
./build/sim --boot [--trace <path>] [--in <path>] [--out <path>] [--cache-stats] [--branch-stats] [--inst-stats] [--cache-ways N] [--cache-sets N] [--cache-line WORDS]
```

## Requirements
- clang++