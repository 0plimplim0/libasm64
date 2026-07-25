#ifndef IO_PRIVATE_H
#define IO_PRIVATE_H

#include "defs.h"

extern int io_scan(char* buf, int n);
extern int io_print(const char *s, int n);
extern int io_open(const char *filename, uint32_t flags, void *IO_STREAM, void *buff, uint32_t buff_size, uint32_t mode);
extern void* io_close(void *IO_STREAM);
extern void io_clear(void);
extern void io_error(const char *msg, uint32_t len, int err);
extern int io_read(void *IO_STREAM, void *dest, uint32_t n);
extern int io_write(void *IO_STREAM, const void *src, uint32_t n);
extern void io_purge(void *IO_STREAM);
extern void io_flush(void *IO_STREAM);
extern void io_seek(void *IO_STREAM, uint32_t n, uint32_t whence);

#endif
