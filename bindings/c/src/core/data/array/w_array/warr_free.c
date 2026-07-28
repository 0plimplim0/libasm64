#include "array.h"
#include "array_private.h"

int warr_free(W_ARRAY *addr) {
  return w_array_free(addr);
}