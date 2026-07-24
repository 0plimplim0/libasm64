#include "string.h"
#include "string_private.h"
#include "defs.h"

uint32_t strchr(const char *s, char v) {
  return str_chr(s, v);
}