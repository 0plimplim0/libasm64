#include "string.h"
#include "string_private.h"
#include "defs.h"

void strrev(char *s) {
  uint32_t len = strlen(s);
  str_rev(s, len);
}