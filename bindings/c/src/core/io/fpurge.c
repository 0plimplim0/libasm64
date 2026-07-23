#include "io.h"
#include "io_private.h"

void fpurge(IO_STREAM *s) {
  io_purge(s);
}