#include "array.h"
#include "array_private.h"
#include "defs.h"

int qarr_push(Q_ARRAY *addr, uint64_t v) {
  return q_array_push(addr, v);
}