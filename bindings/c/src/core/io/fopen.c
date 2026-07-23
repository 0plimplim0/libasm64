#include "io.h"
#include "io_private.h"
#include "defs.h"

int fopen(const char *filename, uint32_t flags, IO_STREAM *s, void *buff, uint32_t buff_size, uint32_t mode) {
  return io_open(filename, flags, s, buff, buff_size, mode);
}