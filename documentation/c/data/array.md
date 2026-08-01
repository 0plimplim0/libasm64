# Array

There are 4 base arrays (`B_ARRAY`, `W_ARRAY`, `D_ARRAY`, `Q_ARRAY`), but the operations and structures are identical.

**Note:** Replace `_arr_` with `barr_` (8-bit), `warr_` (16-bit), `darr_` (32-bit), or `qarr_` (64-bit). Replace `T` with the corresponding type (`uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`) and `ARRAY_TYPE` with `B_ARRAY`, `W_ARRAY`, `D_ARRAY`, or `Q_ARRAY`.

## Index

**[Go back to modules](../index.md).**

- [_arr_new](#_arr_new)
- [_arr_free](#_arr_free)
- [_arr_insert](#_arr_insert)
- [_arr_remove](#_arr_remove)
- [_arr_get](#_arr_get)
- [_arr_push](#_arr_push)
- [_arr_pop](#_arr_pop)
- [_arr_replace](#_arr_replace)
- [_arr_reverse](#_arr_reverse)
- [_arr_size](#_arr_size)
- [_arr_capacity](#_arr_capacity)
- [_arr_fill](#_arr_fill)
- [_arr_find](#_arr_find)
- [_arr_clear](#_arr_clear)
- [_arr_copy](#_arr_copy)
- [_arr_append](#_arr_append)

## Structures

### ArrayHeader
| Bytes       | Field     | Type       | Size    |
| :-----:     | :-----:   | :---:      | :----:  |
| **0 - 3**   | magic     | `uint32_t` | 4 bytes |
| **4**       | ownership | `uint8_t`  | 1 byte  |
| **5**       | p1        | `uint8_t`  | 1 byte  |
| **6 - 7**   | p2        | `uint16_t` | 2 bytes |
| **8 - 11**  | capacity  | `uint32_t` | 4 bytes |
| **12 - 15** | size      | `uint32_t` | 4 bytes |

---

## Functions

### _arr_new
**Allocates a new array with specified initial capacity.**

**Parameters:**
- `uint32_t size`: capacity
- `void *addr`: optional address (pass `NULL` for new heap block)

**Returns:** Pointer to `ARRAY_TYPE` if success, `NULL` if not (sets `_errno`).

---

### _arr_free
**Frees the array memory.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_insert
**Inserts an element at a specific index.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr
- `T v`: value
- `uint32_t pos`: position

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_remove
**Removes an element at a specific index.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr
- `uint32_t pos`: position

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_get
**Gets an element at a specific index.**

**Parameters:**
- `const ARRAY_TYPE *addr`: array_ptr
- `uint32_t pos`: position

**Returns:** Value if success, `0` if error (sets `_errno`).

---

### _arr_push
**Appends an element to the end of the array.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr
- `T v`: value

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_pop
**Removes and returns the last element.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr

**Returns:** Value if success, `0` if error (sets `_errno`).

---

### _arr_replace
**Replaces an element at a specific index.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr
- `T v`: value
- `uint32_t pos`: position

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_reverse
**Reverses the array elements in-place.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_size
**Gets the current number of elements.**

**Parameters:**
- `const ARRAY_TYPE *addr`: array_ptr

**Returns:** Number of elements in array.

---

### _arr_capacity
**Gets the total capacity of the array.**

**Parameters:**
- `const ARRAY_TYPE *addr`: array_ptr

**Returns:** Total array capacity.

---

### _arr_fill
**Fills the array with a single value.**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr
- `T v`: value

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_find
**Finds the index of a value in the array.**

**Parameters:**
- `const ARRAY_TYPE *addr`: array_ptr
- `T v`: value

**Returns:** Index if found, `0` if not found (sets `_errno`).

---

### _arr_clear
**Clears all elements from the array (resets size to 0).**

**Parameters:**
- `ARRAY_TYPE *addr`: array_ptr

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_copy
**Copies source array contents into destination array.**

**Parameters:**
- `const ARRAY_TYPE *src`: source_array
- `ARRAY_TYPE *dest`: destination_array

**Returns:** `0` if success, `< 0` if error code.

---

### _arr_append
**Appends contents of one array to another.**

**Parameters:**
- `const ARRAY_TYPE *src`: source_array
- `ARRAY_TYPE *dest`: destination_array

**Returns:** `0` if success, `< 0` if error code.