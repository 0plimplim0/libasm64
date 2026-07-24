#include "string.h"
#include "string_private.h"

void strcat(char *dest, const char *s1, const char *s2) {
  str_cat(dest, s1, s2);
}