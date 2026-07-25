#ifndef ARRAY_H
#define ARRAY_H

#include "defs.h"

typedef struct {
  uint32_t magic;
  uint8_t ownership;
  uint8_t p1;
  uint16_t p2;
  uint32_t capacity;
  uint32_t size;
} __attribute__((packed)) ArrayHeader;

typedef ArrayHeader B_ARRAY;
typedef ArrayHeader W_ARRAY;
typedef ArrayHeader D_ARRAY;
typedef ArrayHeader Q_ARRAY;

// B_ARRAY
B_ARRAY* barr_new(uint32_t size, void *addr); // addr is optional
void barr_free(B_ARRAY *addr);
void barr_push(B_ARRAY *addr, uint8_t v);
uint8_t barr_pop(B_ARRAY *addr);
void barr_insert(B_ARRAY *addr, uint8_t v, uint32_t pos);
void barr_remove(B_ARRAY *addr, uint32_t pos);
void barr_replace(B_ARRAY *addr, uint8_t v, uint32_t pos);
uint8_t barr_get(const B_ARRAY *addr, uint32_t pos);
uint32_t barr_find(const B_ARRAY *addr, uint8_t v); 
uint32_t barr_size(const B_ARRAY *addr);
uint32_t barr_capacity(const B_ARRAY *addr);
void barr_reverse(B_ARRAY *addr);
void barr_copy(const B_ARRAY *src, B_ARRAY *dest);
void barr_append(const B_ARRAY *src, B_ARRAY *dest);
void barr_fill(B_ARRAY *addr, uint8_t v);
void barr_clear(B_ARRAY *addr);

// W_ARRAY
W_ARRAY* warr_new(uint32_t size, void *addr); // addr is optional
void warr_free(W_ARRAY *addr);
void warr_push(W_ARRAY *addr, uint16_t v);
uint16_t warr_pop(W_ARRAY *addr);
void warr_insert(W_ARRAY *addr, uint16_t v, uint32_t pos);
void warr_remove(W_ARRAY *addr, uint32_t pos);
void warr_replace(W_ARRAY *addr, uint16_t v, uint32_t pos);
uint16_t warr_get(const W_ARRAY *addr, uint32_t pos);
uint32_t warr_find(const W_ARRAY *addr, uint16_t v); 
uint32_t warr_size(const W_ARRAY *addr);
uint32_t warr_capacity(const W_ARRAY *addr);
void warr_reverse(W_ARRAY *addr);
void warr_copy(const W_ARRAY *src, W_ARRAY *dest);
void warr_append(const W_ARRAY *src, W_ARRAY *dest);
void warr_fill(W_ARRAY *addr, uint16_t v);
void warr_clear(W_ARRAY *addr);

// D_ARRAY
D_ARRAY* darr_new(uint32_t size, void *addr); // addr is optional
void darr_free(D_ARRAY *addr);
void darr_push(D_ARRAY *addr, uint32_t v);
uint32_t darr_pop(D_ARRAY *addr);
void darr_insert(D_ARRAY *addr, uint32_t v, uint32_t pos);
void darr_remove(D_ARRAY *addr, uint32_t pos);
void darr_replace(D_ARRAY *addr, uint32_t v, uint32_t pos);
uint32_t darr_get(const D_ARRAY *addr, uint32_t pos);
uint32_t darr_find(const D_ARRAY *addr, uint32_t v); 
uint32_t darr_size(const D_ARRAY *addr);
uint32_t darr_capacity(const D_ARRAY *addr);
void darr_reverse(D_ARRAY *addr);
void darr_copy(const D_ARRAY *src, D_ARRAY *dest);
void darr_append(const D_ARRAY *src, D_ARRAY *dest);
void darr_fill(D_ARRAY *addr, uint32_t v);
void darr_clear(D_ARRAY *addr);

// Q_ARRAY
Q_ARRAY* qarr_new(uint32_t size, void *addr); // addr is optional
void qarr_free(Q_ARRAY *addr);
void qarr_push(Q_ARRAY *addr, uint64_t v);
uint64_t qarr_pop(Q_ARRAY *addr);
void qarr_insert(Q_ARRAY *addr, uint64_t v, uint32_t pos);
void qarr_remove(Q_ARRAY *addr, uint32_t pos);
void qarr_replace(Q_ARRAY *addr, uint64_t v, uint32_t pos);
uint64_t qarr_get(const Q_ARRAY *addr, uint32_t pos);
uint32_t qarr_find(const Q_ARRAY *addr, uint64_t v); 
uint32_t qarr_size(const Q_ARRAY *addr);
uint32_t qarr_capacity(const Q_ARRAY *addr);
void qarr_reverse(Q_ARRAY *addr);
void qarr_copy(const Q_ARRAY *src, Q_ARRAY *dest);
void qarr_append(const Q_ARRAY *src, Q_ARRAY *dest);
void qarr_fill(Q_ARRAY *addr, uint64_t v);
void qarr_clear(Q_ARRAY *addr);

#endif