#include "array.h"
#include "array_private.h"
#include "defs.h"

W_ARRAY* warr_new(uint32_t size, void *addr) {
  return w_array_new(size, addr);
}