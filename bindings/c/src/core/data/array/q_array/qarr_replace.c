#include "array.h"
#include "array_private.h"
#include "defs.h"

int qarr_replace(Q_ARRAY *addr, uint64_t v, uint32_t pos) {
  return q_array_replace(addr, v, pos);
}