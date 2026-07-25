#include "array.h"
#include "array_private.h"
#include "defs.h"

void qarr_remove(Q_ARRAY *addr, uint32_t pos) {
  q_array_remove(addr, pos);
}