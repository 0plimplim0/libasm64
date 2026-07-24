#ifndef STRING_H
#define STRING_H

#include "defs.h"

uint32_t strlen(const char *s);
void strcat(char *dest, const char *s1, const char *s2);
uint32_t strchr(const char *s, char v);
int strcmp(const char *s1, const char *s2, uint32_t limit);
void strcpy(char *dest, const char *src);
void strrev(char *s);
int strsplit(void *dest, char *s, char delimiter);
int strstrip(char *s, char v);
void tolower(char *s);
void tolower_raw(char *s);
void toupper(char *s);
void toupper_raw(char *s);
int64_t atoi64(const char *s);
uint64_t uatoi64(const char *s);
void itoa64(int64_t i, char *s);
void uitoa64(uint64_t i, char *s);

#endif
