#include "array.h"
#include "array_private.h"
#include "defs.h"

void warr_insert(W_ARRAY *addr, uint16_t v, uint32_t pos) {
  w_array_insert(addr, v, pos);
}