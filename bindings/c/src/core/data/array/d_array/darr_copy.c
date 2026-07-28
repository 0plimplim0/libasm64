#include "array.h"
#include "array_private.h"

int darr_copy(const D_ARRAY *src, D_ARRAY *dest) {
  return d_array_copy(src, dest);
}