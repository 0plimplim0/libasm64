#include "array.h"
#include "array_private.h"
#include "defs.h"

uint16_t warr_get(const W_ARRAY *addr, uint32_t pos) {
  return w_array_get(addr, pos);
}