#include "array.h"
#include "array_private.h"
#include "defs.h"

void warr_fill(W_ARRAY *addr, uint16_t v) {
  w_array_fill(addr, v);
}