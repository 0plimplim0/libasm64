# Array

There are 4 base arrays (*b_array*, *w_array*, *d_array*, *q_array*), but the operations and structures are identical.

**Note:** Replace *_array* with *b_array* (8-bit), *w_array* (16-bit), *d_array* (32-bit), or *q_array* (64-bit).

## Index

**[Go back to modules](../index.md).**

- [_array_new](#_array_new)
- [_array_free](#_array_free)
- [_array_insert](#_array_insert)
- [_array_remove](#_array_remove)
- [_array_get](#_array_get)
- [_array_push](#_array_push)
- [_array_pop](#_array_pop)
- [_array_replace](#_array_replace)
- [_array_reverse](#_array_reverse)
- [_array_size](#_array_size)
- [_array_capacity](#_array_capacity)
- [_array_fill](#_array_fill)
- [_array_find](#_array_find)
- [_array_clear](#_array_clear)
- [_array_copy](#_array_copy)
- [_array_append](#_array_append)

## Structures

### Header

| Bytes       | Field     | Size    |
| :-----:     | :-----:   | :----:  |
| **0 - 3** | Magic (`0x59525241`) | 4 bytes |
| **4** | Ownership | 1 byte |
| **5 - 7** | Padding | 3 bytes |
| **8 - 11** | Capacity | 4 bytes |
| **12 - 15** | Size | 4 bytes |


## Functions

### _array_new
**Allocates a new array with specified capacity**

- `RDI`: size
- `RSI`: addr (Optional, 0 for new heap block)

**Returns:** Pointer to array if success, 0 if not(sets _errno).

---

### _array_free
**Frees the array memory**

- `RDI`: arr_addr

**Returns:** 0 if success, < 0 if not.

---

### _array_insert
**Inserts an element at a specific index**

- `RDI`: arr_addr
- `RSI`: value
- `RDX`: index

**Returns:** 0 if success, < 0 if not.

---

### _array_remove
**Removes an element at a specific index**

- `RDI`: arr_addr
- `RSI`: index

**Returns:** 0 if success, < 0 if not.

---

### _array_get
**Gets an element at a specific index**

- `RDI`: arr_addr
- `RSI`: index

**Returns:** Value if success, 0 if not (sets _errno).

---

### _array_push
**Appends an element to the end of the array**

- `RDI`: arr_addr
- `RSI`: value

**Returns:** 0 if success, < 0 if not.

---

### _array_pop
**Removes and returns the last element**

- `RDI`: arr_addr

**Returns:** Value if success, 0 if not (sets _errno).

---

### _array_replace
**Replaces an element at a specific index**

- `RDI`: arr_addr
- `RSI`: value
- `RDX`: index

**Returns:** 0 if success, < 0 if not.

---

### _array_reverse
**Reverses the array elements in-place**

- `RDI`: arr_addr

**Returns:** 0 if success, < 0 if not.

---

### _array_size
**Gets the current number of elements**

- `RDI`: arr_addr

**Returns:** Size if success, 0 if not (sets _errno).

---

### _array_capacity
**Gets the total capacity of the array**

- `RDI`: arr_addr

**Returns:** Capacity if success, 0 if not (set _errno).

---

### _array_fill
**Fills the array with a single value**

- `RDI`: arr_addr
- `RSI`: value

**Returns:** 0 if success, < 0 if not.

---

### _array_find
**Finds the index of a value in the array**

- `RDI`: arr_addr
- `RSI`: value

**Returns:** Index if success, 0 if not (sets _errno).

---

### _array_clear
**Clears all elements from the array (resets size to 0)**

- `RDI`: arr_addr

**Returns:** 0 if success, < 0 if not.

---

### _array_copy
**Copies source array contents into destination array**

- `RDI`: src_arr
- `RSI`: dest_arr

**Returns:** 0 if success, < 0 if not.

---

### _array_append
**Appends contents of one array to another**

- `RDI`: src_arr
- `RSI`: dest_arr

**Returns:** 0 if success, < 0 if not.
