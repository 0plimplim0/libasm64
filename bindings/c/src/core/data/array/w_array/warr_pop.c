#include "array.h"
#include "array_private.h"
#include "defs.h"

uint16_t warr_pop(W_ARRAY *addr) {
  return w_array_pop(addr);
}