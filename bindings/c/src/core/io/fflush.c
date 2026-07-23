#include "io.h"
#include"io_private.h"

void fflush(IO_STREAM *s) {
  io_flush(s);
}