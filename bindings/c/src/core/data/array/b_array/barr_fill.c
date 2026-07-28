#include "array.h"
#include "array_private.h"
#include "defs.h"

int barr_fill(B_ARRAY *addr, uint8_t v) {
  return b_array_fill(addr, v);
}