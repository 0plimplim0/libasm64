#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t qarr_size(const Q_ARRAY *addr) {
  return q_array_size(addr);
}