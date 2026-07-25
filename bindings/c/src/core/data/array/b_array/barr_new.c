#include "array.h"
#include "array_private.h"
#include "defs.h"

B_ARRAY* barr_new(uint32_t size, void *addr) {
  return b_array_new(size, addr);
}