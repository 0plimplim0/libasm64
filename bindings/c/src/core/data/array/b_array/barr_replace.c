#include "array.h"
#include "array_private.h"
#include "defs.h"

int barr_replace(B_ARRAY *addr, uint8_t v, uint32_t pos) {
  return b_array_replace(addr, v, pos);
}