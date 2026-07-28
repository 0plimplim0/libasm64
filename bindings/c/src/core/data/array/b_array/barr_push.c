#include "array.h"
#include "array_private.h"
#include "defs.h"

int barr_push(B_ARRAY *addr, uint8_t v) {
  return b_array_push(addr, v);
}