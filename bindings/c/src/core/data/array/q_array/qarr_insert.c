#include "array.h"
#include "array_private.h"
#include "defs.h"

void qarr_insert(Q_ARRAY *addr, uint64_t v, uint32_t pos) {
  q_array_insert(addr, v, pos);
}