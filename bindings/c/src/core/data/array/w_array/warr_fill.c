#include "array.h"
#include "array_private.h"
#include "defs.h"

int warr_fill(W_ARRAY *addr, uint16_t v) {
  return w_array_fill(addr, v);
}