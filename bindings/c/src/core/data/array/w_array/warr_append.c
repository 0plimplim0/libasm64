#include "array.h"
#include "array_private.h"

void warr_append(const W_ARRAY *src, W_ARRAY *dest) {
  w_array_append(src, dest);
}