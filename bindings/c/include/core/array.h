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
int barr_free(B_ARRAY *addr);
int barr_push(B_ARRAY *addr, uint8_t v);
uint8_t barr_pop(B_ARRAY *addr);
int barr_insert(B_ARRAY *addr, uint8_t v, uint32_t pos);
int barr_remove(B_ARRAY *addr, uint32_t pos);
int barr_replace(B_ARRAY *addr, uint8_t v, uint32_t pos);
uint8_t barr_get(const B_ARRAY *addr, uint32_t pos);
uint32_t barr_find(const B_ARRAY *addr, uint8_t v); 
uint32_t barr_size(const B_ARRAY *addr);
uint32_t barr_capacity(const B_ARRAY *addr);
int barr_reverse(B_ARRAY *addr);
int barr_copy(const B_ARRAY *src, B_ARRAY *dest);
int barr_append(const B_ARRAY *src, B_ARRAY *dest);
int barr_fill(B_ARRAY *addr, uint8_t v);
int barr_clear(B_ARRAY *addr);

// W_ARRAY
W_ARRAY* warr_new(uint32_t size, void *addr); // addr is optional
int warr_free(W_ARRAY *addr);
int warr_push(W_ARRAY *addr, uint16_t v);
uint16_t warr_pop(W_ARRAY *addr);
int warr_insert(W_ARRAY *addr, uint16_t v, uint32_t pos);
int warr_remove(W_ARRAY *addr, uint32_t pos);
int warr_replace(W_ARRAY *addr, uint16_t v, uint32_t pos);
uint16_t warr_get(const W_ARRAY *addr, uint32_t pos);
uint32_t warr_find(const W_ARRAY *addr, uint16_t v); 
uint32_t warr_size(const W_ARRAY *addr);
uint32_t warr_capacity(const W_ARRAY *addr);
int warr_reverse(W_ARRAY *addr);
int warr_copy(const W_ARRAY *src, W_ARRAY *dest);
int warr_append(const W_ARRAY *src, W_ARRAY *dest);
int warr_fill(W_ARRAY *addr, uint16_t v);
int warr_clear(W_ARRAY *addr);

// D_ARRAY
D_ARRAY* darr_new(uint32_t size, void *addr); // addr is optional
int darr_free(D_ARRAY *addr);
int darr_push(D_ARRAY *addr, uint32_t v);
uint32_t darr_pop(D_ARRAY *addr);
int darr_insert(D_ARRAY *addr, uint32_t v, uint32_t pos);
int darr_remove(D_ARRAY *addr, uint32_t pos);
int darr_replace(D_ARRAY *addr, uint32_t v, uint32_t pos);
uint32_t darr_get(const D_ARRAY *addr, uint32_t pos);
uint32_t darr_find(const D_ARRAY *addr, uint32_t v); 
uint32_t darr_size(const D_ARRAY *addr);
uint32_t darr_capacity(const D_ARRAY *addr);
int darr_reverse(D_ARRAY *addr);
int darr_copy(const D_ARRAY *src, D_ARRAY *dest);
int darr_append(const D_ARRAY *src, D_ARRAY *dest);
int darr_fill(D_ARRAY *addr, uint32_t v);
int darr_clear(D_ARRAY *addr);

// Q_ARRAY
Q_ARRAY* qarr_new(uint32_t size, void *addr); // addr is optional
int qarr_free(Q_ARRAY *addr);
int qarr_push(Q_ARRAY *addr, uint64_t v);
uint64_t qarr_pop(Q_ARRAY *addr);
int qarr_insert(Q_ARRAY *addr, uint64_t v, uint32_t pos);
int qarr_remove(Q_ARRAY *addr, uint32_t pos);
int qarr_replace(Q_ARRAY *addr, uint64_t v, uint32_t pos);
uint64_t qarr_get(const Q_ARRAY *addr, uint32_t pos);
uint32_t qarr_find(const Q_ARRAY *addr, uint64_t v); 
uint32_t qarr_size(const Q_ARRAY *addr);
uint32_t qarr_capacity(const Q_ARRAY *addr);
int qarr_reverse(Q_ARRAY *addr);
int qarr_copy(const Q_ARRAY *src, Q_ARRAY *dest);
int qarr_append(const Q_ARRAY *src, Q_ARRAY *dest);
int qarr_fill(Q_ARRAY *addr, uint64_t v);
int qarr_clear(Q_ARRAY *addr);

#endif