#pragma once

#include <bit>
#include <cstdint>

// float <-> uint32_t : bit-level casting
inline float to_float(uint32_t value) {
    return std::bit_cast<float>(value);
}

inline uint32_t to_uint32(float value) {
    return std::bit_cast<uint32_t>(value);
}

// bit operations
inline uint32_t get_bits(uint32_t value, int start, int end){ // value[start:end]
    return (value >> start) & ((1 << (end - start + 1)) - 1);
}
inline void set_bits(uint32_t &value, int start, int end, uint32_t new_value){ // value[start:end] = new_value
    uint32_t mask = ((1 << (end - start + 1)) - 1) << start;
    value = (value & ~mask) | ((new_value << start) & mask);
}