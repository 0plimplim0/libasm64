#include "array.h"
#include "array_private.h"
#include "defs.h"

uint8_t barr_get(const B_ARRAY *addr, uint32_t pos) {
  return b_array_get(addr, pos);
}