#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t barr_find(const B_ARRAY *addr, uint8_t v) {
  return b_array_find(addr, v);
}