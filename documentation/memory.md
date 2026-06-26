# Memory utils

## Index

- [mem_cmp](#mem_cmp)
- [mem_cpy](#mem_cpy)
- [mem_mov](#mem_mov)
- [mem_set](#mem_set)

## Functions

### mem_cmp
**Compares 2 memory blocks.**

**Inputs:**
- `RDI`: block1_addr
- `RSI`: block2_addr
- `RDX`: n_bytes

**Returns:** 0 in `RAX` if equal, -1 if not.

---

### mem_cpy
**Copies a memory block to another.**

**Inputs:**
- `RDI`: src_addr
- `RSI`: dest_addr
- `RDX`: n_bytes

**Returns:** None. (Modifies **dest_addr**)

---

### mem_mov
**Copies a memory block to another using an intermediate buffer.**

**Inputs:**
- `RDI`: src_addr
- `RSI`: dest_addr
- `RDX`: n_bytes

**Returns:** None. (Modifies **dest_addr**)

---

### mem_set
**Sets all bytes in a memory block to a single byte.**

**Inputs:**
- `RDI`: block_addr
- `RSI`: n_bytes
- `RDX`: byte

**Returns:** None. (Modifies **block_addr**)
---