#include "system.h"
#include "system_private.h"

void exit(int exit_code) {
  sys_exit(exit_code);
}