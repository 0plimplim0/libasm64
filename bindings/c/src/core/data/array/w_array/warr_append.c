#include "array.h"
#include "array_private.h"

int warr_append(const W_ARRAY *src, W_ARRAY *dest) {
  return w_array_append(src, dest);
}