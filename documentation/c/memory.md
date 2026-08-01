# Memory utils

## Index

**[Go back to modules](index.md).**

- [memcmp](#memcmp)
- [memcpy](#memcpy)
- [memmov](#memmov)
- [memset](#memset)
- [malloc](#malloc)
- [free](#free)

## Functions

### memcmp
**Compares 2 memory blocks.**

**Parameters:**
- `const void *m1`: block1_addr
- `const void *m2`: block2_addr
- `size_t n`: n_bytes

**Returns:** 0 if equal, -1 if not.

---

### memcpy
**Copies a memory block to another.**

**Parameters:**
- `void *dest`: dest_addr
- `const void *src`: src_addr
- `size_t n`: n_bytes

**Returns:** None. (Modifies **dest**)

---

### memmov
**Copies a memory block to another using an intermediate buffer.**

**Parameters:**
- `void *dest`: dest_addr
- `const void *src`: src_addr
- `size_t n`: n_bytes

**Returns:** None. (Modifies **dest**)

---

### memset
**Sets all bytes in a memory block to a single byte.**

**Parameters:**
- `void *m`: block_addr
- `uint8_t b`: byte
- `size_t n`: n_bytes

**Returns:** None. (Modifies **m**)

---

### malloc
**Assigns memory blocks from the heap.**

**Parameters:**
- `size_t size`: size

**Returns:** Address of the block
**Note:** The limit of blocks is 4,294,967,295.

---

### free
**Frees memory blocks assigned by malloc.**

**Parameters:**
- `void *m`: block_addr

**Returns:** None.