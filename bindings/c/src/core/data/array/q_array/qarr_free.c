#include "array.h"
#include "array_private.h"

void qarr_free(Q_ARRAY *addr) {
  q_array_free(addr);
}