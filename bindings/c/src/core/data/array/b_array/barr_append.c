#include "array.h"
#include "array_private.h"

int barr_append(const B_ARRAY *src, B_ARRAY *dest) {
  return b_array_append(src, dest);
}