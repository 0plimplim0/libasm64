#include "system.h"
#include "system_private.h"
#include "defs.h"

int64_t syscall(uint64_t n, ...) {
  return sys_call(n);
}