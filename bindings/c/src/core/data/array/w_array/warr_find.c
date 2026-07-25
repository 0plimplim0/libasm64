#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t warr_find(const W_ARRAY *addr, uint16_t v) {
  return w_array_find(addr, v);
}