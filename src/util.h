#pragma once

#include <bit>

// float <-> uint32_t : bit-level casting
inline float to_float(uint32_t value) {
    return std::bit_cast<float>(value);
}

inline uint32_t to_uint32(float value) {
    return std::bit_cast<uint32_t>(value);
}