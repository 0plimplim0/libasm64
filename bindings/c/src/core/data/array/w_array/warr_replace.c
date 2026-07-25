#include "array.h"
#include "array_private.h"
#include "defs.h"

void warr_replace(W_ARRAY *addr, uint16_t v, uint32_t pos) {
  w_array_replace(addr, v, pos);
}