#include "array.h"
#include "array_private.h"

int darr_append(const D_ARRAY *src, D_ARRAY *dest) {
  return d_array_append(src, dest);
}