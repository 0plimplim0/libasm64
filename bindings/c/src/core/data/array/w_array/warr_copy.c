#include "array.h"
#include "array_private.h"

int warr_copy(const W_ARRAY *src, W_ARRAY *dest) {
  return w_array_copy(src, dest);
}