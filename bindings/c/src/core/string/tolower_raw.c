#include "string.h"
#include "string_private.h"
#include "defs.h"

void tolower_raw(char *s) {
  uint32_t len = strlen(s);
  str_tolower_raw(s, len);
}