#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t barr_capacity(const B_ARRAY *addr) {
  return b_array_capacity(addr);
}