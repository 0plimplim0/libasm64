#include "array.h"
#include "array_private.h"
#include "defs.h"

int warr_remove(W_ARRAY *addr, uint32_t pos) {
  return w_array_remove(addr, pos);
}