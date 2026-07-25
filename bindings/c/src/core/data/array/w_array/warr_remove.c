#include "array.h"
#include "array_private.h"
#include "defs.h"

void warr_remove(W_ARRAY *addr, uint32_t pos) {
  w_array_remove(addr, pos);
}