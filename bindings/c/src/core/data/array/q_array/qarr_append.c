#include "array.h"
#include "array_private.h"
#include "defs.h"

void qarr_append(const Q_ARRAY *src, Q_ARRAY *dest) {
  q_array_append(src, dest);
}