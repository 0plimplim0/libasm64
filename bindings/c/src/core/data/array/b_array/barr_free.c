#include "array.h"
#include "array_private.h"

int barr_free(B_ARRAY *addr) {
  return b_array_free(addr);
}