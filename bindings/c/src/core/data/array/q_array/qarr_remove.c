#include "array.h"
#include "array_private.h"
#include "defs.h"

int qarr_remove(Q_ARRAY *addr, uint32_t pos) {
  return q_array_remove(addr, pos);
}