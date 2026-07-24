#include "string.h"
#include "string_private.h"
#include "defs.h"

void toupper(char *s) {
  uint32_t len = strlen(s);
  str_toupper(s, len);
}