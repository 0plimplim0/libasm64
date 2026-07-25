#include "array.h"
#include "array_private.h"

void darr_append(const D_ARRAY *src, D_ARRAY *dest) {
  d_array_append(src, dest);
}