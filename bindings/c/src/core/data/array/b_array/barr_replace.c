#include "array.h"
#include "array_private.h"
#include "defs.h"

void barr_replace(B_ARRAY *addr, uint8_t v, uint32_t pos) {
  b_array_replace(addr, v, pos);
}