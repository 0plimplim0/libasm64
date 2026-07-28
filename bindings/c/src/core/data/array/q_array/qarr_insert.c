#include "array.h"
#include "array_private.h"
#include "defs.h"

int qarr_insert(Q_ARRAY *addr, uint64_t v, uint32_t pos) {
  return q_array_insert(addr, v, pos);
}