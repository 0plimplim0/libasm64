#include "array.h"
#include "array_private.h"

void warr_free(W_ARRAY *addr) {
  w_array_free(addr);
}