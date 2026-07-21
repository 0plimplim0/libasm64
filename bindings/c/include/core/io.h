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
int scan(char* dest_addr, uint32_t n_bytes);
int print(const char* str);
void error(const char* msg, int err_code);
void fflush(IO_STREAM* s);
int fopen(const char* filename, int flags, IO_STREAM* s, size_t buff_addr, uint32_t buff_size, int mode);
int fclose(IO_STREAM* s);
void fpurge(IO_STREAM* s);
int fread(IO_STREAM* s, size_t dest_addr, uint32_t n_bytes);
void fseek(IO_STREAM* s, uint32_t n_bytes, int whence);
int fwrite(IO_STREAM* s, size_t src_addr, uint32_t n_bytes);

#endif
