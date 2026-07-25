#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t warr_size(const W_ARRAY *addr) {
  return w_array_size(addr);
}