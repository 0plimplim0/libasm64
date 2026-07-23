#ifndef IO_H
#define IO_H

#include "defs.h"

typedef struct {
  uint32_t fd;
  uint64_t buff_addr;
  uint32_t write_ptr;
  uint32_t read_ptr;
  uint32_t buff_size;
  uint8_t buff_type;
  uint8_t s_status;
  uint8_t s_type;
  uint8_t s_mode;
  uint32_t padding;
} __attribute__((packed)) IO_STREAM;

void clear(void);
int scan(char *dest_addr, uint32_t n_bytes);
int print(const char *str);
void error(const char *msg, int err_code);
void fflush(IO_STREAM *s);
int fopen(const char *filename, uint32_t flags, IO_STREAM *s, void *buff, uint32_t buff_size, uint32_t mode);
void* fclose(IO_STREAM *s);
void fpurge(IO_STREAM *s);
int fread(IO_STREAM *s, void *dest, uint32_t n);
void fseek(IO_STREAM *s, uint32_t n, uint32_t whence);
int fwrite(IO_STREAM *s, const void *src, uint32_t n);

#endif
