#include "array.h"
#include "array_private.h"
#include "defs.h"

void qarr_fill(Q_ARRAY *addr, uint64_t v) {
  q_array_fill(addr, v);
}