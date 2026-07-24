#include "string.h"
#include "string_private.h"
#include "defs.h"

void uitoa64(uint64_t i, char *s) {
  str_uitoa64(i, s);
}