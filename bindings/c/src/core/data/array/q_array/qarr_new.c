#include "array.h"
#include "array_private.h"
#include "defs.h"

Q_ARRAY* qarr_new(uint32_t size, void *addr) {
  return q_array_new(size, addr);
}