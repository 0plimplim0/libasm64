#include "array.h"
#include "array_private.h"

void barr_free(B_ARRAY *addr) {
  b_array_free(addr);
}