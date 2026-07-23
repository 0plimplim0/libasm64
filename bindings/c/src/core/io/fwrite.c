#include "io.h"
#include "io_private.h"
#include "defs.h"

int fwrite(IO_STREAM *s, const void *src, uint32_t n) {
  return io_write(s, src, n);
}