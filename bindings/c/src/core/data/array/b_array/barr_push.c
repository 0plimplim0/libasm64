#include "array.h"
#include "array_private.h"
#include "defs.h"

void barr_push(B_ARRAY *addr, uint8_t v) {
  b_array_push(addr, v);
}