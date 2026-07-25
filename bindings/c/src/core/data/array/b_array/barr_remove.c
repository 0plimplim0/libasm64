#include "array.h"
#include "array_private.h"
#include "defs.h"

void barr_remove(B_ARRAY *addr, uint32_t pos) {
  b_array_remove(addr, pos);
}