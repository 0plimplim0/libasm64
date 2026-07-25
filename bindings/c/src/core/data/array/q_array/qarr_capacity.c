#include "array.h"
#include "array_private.h"
#include "defs.h"

uint32_t qarr_capacity(const Q_ARRAY *addr) {
  return q_array_capacity(addr);
}