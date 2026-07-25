#include "array.h"
#include "array_private.h"
#include "defs.h"

uint64_t qarr_get(const Q_ARRAY *addr, uint32_t pos) {
  return q_array_get(addr, pos);
}