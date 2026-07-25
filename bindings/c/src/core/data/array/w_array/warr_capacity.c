#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t warr_capacity(const W_ARRAY *addr) {
  return w_array_capacity(addr);
}