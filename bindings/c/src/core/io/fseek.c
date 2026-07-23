#include "io.h"
#include "io_private.h"
#include "defs.h"

void fseek(IO_STREAM *s, uint32_t n, uint32_t whence) {
  io_seek(s, n, whence);
}