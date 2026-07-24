#include "string.h"
#include "string_private.h"

int strsplit(void *dest, char *s, char delimiter) {
  return str_split(dest, s, delimiter);
}