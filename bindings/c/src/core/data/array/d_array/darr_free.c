#include "array.h"
#include "array_private.h"

int darr_free(D_ARRAY *addr) {
  return d_array_free(addr);
}