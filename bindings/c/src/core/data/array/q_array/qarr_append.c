#include "array.h"
#include "array_private.h"
#include "defs.h"

int qarr_append(const Q_ARRAY *src, Q_ARRAY *dest) {
  return q_array_append(src, dest);
}