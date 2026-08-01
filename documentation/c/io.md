# IO utils

## Index

**[Go back to modules](index.md).**

- [clear](#clear)
- [error](#error)
- [print](#print)
- [scan](#scan)
- [fopen](#fopen)
- [fclose](#fclose)
- [fread](#fread)
- [fwrite](#fwrite)
- [fpurge](#fpurge)
- [fflush](#fflush)
- [fseek](#fseek)

## Structures

### IO_STREAM
| Bytes       | Field     | Size    |
| :-----:     | :-----:   | :----:  |
| **0 - 3**   | fd        | 4 bytes |
| **4 - 11**  | buff_addr | 8 bytes |
| **12 - 15** | write_ptr | 4 bytes |
| **16 - 19** | read_ptr  | 4 bytes |
| **20 - 23** | buff_size | 4 bytes |
| **24**      | buff_type | 1 byte  |
| **25**      | s_status  | 1 byte  |
| **26**      | s_type    | 1 byte  |
| **27**      | s_mode    | 1 byte  |
| **28 - 31** | padding   | 4 bytes |

## Functions

### clear
**Clears the terminal.**

**Parameters:**
- None

**Returns:** None.

---

### error
**Sends an error message to stderr, and exits with an error code if critical.**

**Parameters:**
- `const char *msg`: error_message
- `int err_code`: error_code

**Returns:** None. (Exits the program if `err_code != 0`)

---

### print
**Sends a null-terminated string to stdout.**

**Parameters:**
- `const char *str`: str_addr

**Returns:** Number of bytes written.

---

### scan
**Reads from stdin.**

**Parameters:**
- `char *dest_addr`: buffer_address
- `uint32_t n_bytes`: bytes_to_read

**Returns:** Number of bytes read.

---

### fopen
**Opens a file and initializes an IO_STREAM struct.**

**Parameters:**
- `const char *filename`: file_path
- `uint32_t flags`: open_flags
- `IO_STREAM *s`: stream_struct_ptr
- `void *buff`: buffer_address
- `uint32_t buff_size`: buffer_size
- `uint32_t mode`: file_mode

**Returns:** `0` if success, `< 0` if error.

---

### fclose
**Closes a file stream.**

**Parameters:**
- `IO_STREAM *s`: stream_struct_ptr

**Returns:** Pointer to the buffer (`buff_addr`).

---

### fread
**Reads from an IO_STREAM.**

**Parameters:**
- `IO_STREAM *s`: stream_struct_ptr
- `void *dest`: destination_buffer
- `uint32_t n`: bytes_to_read

**Returns:** Number of bytes read.

---

### fwrite
**Writes to an IO_STREAM.**

**Parameters:**
- `IO_STREAM *s`: stream_struct_ptr
- `const void *src`: source_buffer
- `uint32_t n`: bytes_to_write

**Returns:** Number of bytes written.

---

### fpurge
**Resets internal read/write pointers of an IO_STREAM.**

**Parameters:**
- `IO_STREAM *s`: stream_struct_ptr

**Returns:** None.

---

### fflush
**Flushes the IO_STREAM buffer.**

**Parameters:**
- `IO_STREAM *s`: stream_struct_ptr

**Returns:** None.

---

### fseek
**Moves file pointer offset.**

**Parameters:**
- `IO_STREAM *s`: stream_struct_ptr
- `uint32_t n`: offset_bytes
- `uint32_t whence`: reference_position

**Returns:** None.