#ifndef SYSTEM_PRIVATE_H
#define SYSTEM_PRIVATE_H

#include "defs.h"

extern void sys_exit(int exit_code);
extern int64_t sys_call(uint64_t n, ...);

#endif