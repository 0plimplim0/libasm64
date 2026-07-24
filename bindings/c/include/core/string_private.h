#ifndef STRING_PRIVATE_H
#define STRING_PRIVATE_H

#include "defs.h"

extern uint32_t str_len(const char *s);
extern void str_cat(char *dest, const char *s1, const char *s2);
extern uint32_t str_chr(const char *s, char v);
extern int str_cmp(const char *s1, const char *s2, uint32_t limit);
extern void str_cpy(char *dest, const char *src);
extern void str_rev(char *s, uint32_t len);
extern int str_split(void *dest, char *s, char delimiter); // Update src function to return n elements (int)
extern int str_strip(char *s, char v); // Update src function to return n chars removed (int)
extern void str_tolower(char *s, uint32_t len);
extern void str_tolower_raw(char *s, uint32_t len);
extern void str_toupper(char *s, uint32_t len);
extern void str_toupper_raw(char *s, uint32_t len);
extern int64_t str_atoi64(const char *s);
extern uint64_t str_uatoi64(const char *s);
extern void str_itoa64(int64_t i, char *s);
extern void str_uitoa64(uint64_t i, char *s);

#endif
