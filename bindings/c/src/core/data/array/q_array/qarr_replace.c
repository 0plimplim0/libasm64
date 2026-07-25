#include "array.h"
#include "array_private.h"
#include "defs.h"

void qarr_replace(Q_ARRAY *addr, uint64_t v, uint32_t pos) {
  q_array_replace(addr, v, pos);
}