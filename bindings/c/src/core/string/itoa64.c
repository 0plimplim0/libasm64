#include "string.h"
#include "string_private.h"
#include "defs.h"

void itoa64(int64_t i, char *s) {
  str_itoa64(i, s);
}