#include "string.h"
#include "string_private.h"
#include "defs.h"

int strcmp(const char *s1, const char *s2, uint32_t limit) {
  return str_cmp(s1, s2, limit);
}