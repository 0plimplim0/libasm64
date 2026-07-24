#include "string.h"
#include "string_private.h"

void strcpy(char *dest, const char *src) {
  str_cpy(dest, src);
}