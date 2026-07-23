#include "io.h"
#include "io_private.h"
#include "string.h"
#include "defs.h"

void error(const char *msg, int err) {
  uint32_t l = strlen(msg);
  io_error(msg, l, err);
}