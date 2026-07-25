#include "array.h"
#include "array_private.h"
#include "defs.h"

uint64_t qarr_pop(Q_ARRAY *addr) {
  return q_array_pop(addr);
}