#ifndef ARRAY_PRIVATE_H
#define ARRAY_PRIVATE_H

#include "defs.h"

// B_ARRAY
extern void* b_array_new(uint32_t size, void *addr); // addr is optional
extern int b_array_free(void *addr);
extern int b_array_push(void *addr, uint8_t v);
extern uint8_t b_array_pop(void *addr);
extern int b_array_insert(void *addr, uint8_t v, uint32_t pos);
extern int b_array_remove(void *addr, uint32_t pos);
extern int b_array_replace(void *addr, uint8_t v, uint32_t pos);
extern uint8_t b_array_get(const void *addr, uint32_t pos);
extern uint32_t b_array_find(const void *addr, uint8_t v); 
extern uint32_t b_array_size(const void *addr);
extern uint32_t b_array_capacity(const void *addr);
extern int b_array_reverse(void *addr);
extern int b_array_copy(const void *src, void *dest);
extern int b_array_append(const void *src, void *dest);
extern int b_array_fill(void *addr, uint8_t v);
extern int b_array_clear(void *addr);

// W_ARRAY
extern void* w_array_new(uint32_t size, void *addr); // addr is optional
extern int w_array_free(void *addr);
extern int w_array_push(void *addr, uint16_t v);
extern uint16_t w_array_pop(void *addr);
extern int w_array_insert(void *addr, uint16_t v, uint32_t pos);
extern int w_array_remove(void *addr, uint32_t pos);
extern int w_array_replace(void *addr, uint16_t v, uint32_t pos);
extern uint16_t w_array_get(const void *addr, uint32_t pos);
extern uint32_t w_array_find(const void *addr, uint16_t v); 
extern uint32_t w_array_size(const void *addr);
extern uint32_t w_array_capacity(const void *addr);
extern int w_array_reverse(void *addr);
extern int w_array_copy(const void *src, void *dest);
extern int w_array_append(const void *src, void *dest);
extern int w_array_fill(void *addr, uint16_t v);
extern int w_array_clear(void *addr);

// D_ARRAY
extern void* d_array_new(uint32_t size, void *addr); // addr is optional
extern int d_array_free(void *addr);
extern int d_array_push(void *addr, uint32_t v);
extern uint32_t d_array_pop(void *addr);
extern int d_array_insert(void *addr, uint32_t v, uint32_t pos);
extern int d_array_remove(void *addr, uint32_t pos);
extern int d_array_replace(void *addr, uint32_t v, uint32_t pos);
extern uint32_t d_array_get(const void *addr, uint32_t pos);
extern uint32_t d_array_find(const void *addr, uint32_t v); 
extern uint32_t d_array_size(const void *addr);
extern uint32_t d_array_capacity(const void *addr);
extern int d_array_reverse(void *addr);
extern int d_array_copy(const void *src, void *dest);
extern int d_array_append(const void *src, void *dest);
extern int d_array_fill(void *addr, uint32_t v);
extern int d_array_clear(void *addr);

// Q_ARRAY
extern void* q_array_new(uint32_t size, void *addr); // addr is optional
extern int q_array_free(void *addr);
extern int q_array_push(void *addr, uint64_t v);
extern uint64_t q_array_pop(void *addr);
extern int q_array_insert(void *addr, uint64_t v, uint32_t pos);
extern int q_array_remove(void *addr, uint32_t pos);
extern int q_array_replace(void *addr, uint64_t v, uint32_t pos);
extern uint64_t q_array_get(const void *addr, uint32_t pos);
extern uint32_t q_array_find(const void *addr, uint64_t v); 
extern uint32_t q_array_size(const void *addr);
extern uint32_t q_array_capacity(const void *addr);
extern int q_array_reverse(void *addr);
extern int q_array_copy(const void *src, void *dest);
extern int q_array_append(const void *src, void *dest);
extern int q_array_fill(void *addr, uint64_t v);
extern int q_array_clear(void *addr);

#endif