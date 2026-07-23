#include "io.h"
#include "io_private.h"

void* fclose(IO_STREAM *s) {
  return io_close(s);
}