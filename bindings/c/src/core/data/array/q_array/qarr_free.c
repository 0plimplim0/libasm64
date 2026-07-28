#include "array.h"
#include "array_private.h"

int qarr_free(Q_ARRAY *addr) {
  return q_array_free(addr);
}