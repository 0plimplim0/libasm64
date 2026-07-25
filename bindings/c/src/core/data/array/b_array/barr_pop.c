#include "array.h"
#include "array_private.h"
#include "defs.h"

uint8_t barr_pop(B_ARRAY *addr) {
  return b_array_pop(addr);
}