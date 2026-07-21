#include "io.h"
#include "string.h"
#include "io_private.h"
#include "defs.h"

int print(const char *s) {
  int l = strlen(s);
  return io_print(s, l);
}
