#include "array.h"
#include "array_private.h"

void darr_free(D_ARRAY *addr) {
  d_array_free(addr);
}