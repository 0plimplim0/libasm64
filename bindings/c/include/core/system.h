#ifndef SYSTEM_H
#define SYSTEM_H

#include "defs.h"

void exit(int exit_code);
int64_t syscall(uint64_t n, ...);   // Need to cast (void*) if expects a ptr

#endif