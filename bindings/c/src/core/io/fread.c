#include "io.h"
#include "io_private.h"
#include "defs.h"

int fread(IO_STREAM *s, void *dest, uint32_t n) {
  return io_read(s, dest, n);
}