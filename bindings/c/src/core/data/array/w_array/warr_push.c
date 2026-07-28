#include "array.h"
#include "array_private.h"
#include "defs.h"

int warr_push(W_ARRAY *addr, uint16_t v) {
  return w_array_push(addr, v);
}