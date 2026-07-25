#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t qarr_find(const Q_ARRAY *addr, uint64_t v) {
  return q_array_find(addr, v);
}