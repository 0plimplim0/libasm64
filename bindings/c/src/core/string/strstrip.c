#include "string.h"
#include "string_private.h"

int strstrip(char *s, char v) {
  return str_strip(s, v);
}