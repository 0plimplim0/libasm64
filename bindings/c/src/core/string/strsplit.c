#include "string.h"
#include "string_private.h"

int strsplit(void *dest, char *s, char c) {
  return str_split(dest, s, c);
}