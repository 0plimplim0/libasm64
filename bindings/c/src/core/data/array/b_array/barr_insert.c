#include "array.h"
#include "array_private.h"
#include "defs.h"

void barr_insert(B_ARRAY *addr, uint8_t v, uint32_t pos) {
  b_array_insert(addr, v, pos);
}