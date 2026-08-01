# IO utils

## Index

**[Go back to modules](index.md).**

- [io_clear](#io_clear)
- [io_error](#io_error)
- [io_print](#io_print)
- [io_scan](#io_scan)
- [io_open](#io_open)
- [io_close](#io_close)
- [io_read](#io_read)
- [io_write](#io_write)
- [io_purge](#io_purge)
- [io_flush](#io_flush)
- [io_seek](#io_seek)

## Structures

### IO_STREAM
| Bytes       | Field     | Size    |
| :-----:     | :-----:   | :----:  |
| **0 - 3**   | FD        | 4 bytes |
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

### io_clear
**Clears the terminal**

**Inputs:**
- `None`

**Returns:** None.

---

### io_error
**Sends an error message to stderr, and exit with an error code if the error was critical.**

**Inputs:**
- `RDI`: str_addr
- `RSI`: str_len
- `RDX`: err_num

**Returns:** None. (If **err_num** != 0 exit the program with the error code)

---

### io_print
**Sends a string to stdout**

**Inputs:**
- `RDI`: str_addr
- `RSI`: str_len

**Returns:** n_bytes written.

---

### io_scan
**Read from stdin**

**Inputs:**
- `RDI`: buff
- `RSI`: n_bytes

**Returns:** n_bytes read.

---

### io_open
**Open a file**

**Inputs:**
- `RDI`: filename
- `RSI`: flags
- `RDX`: IO_STREAM_addr(32 bytes)
- `RCX`: buff_addr
- `R8`: buff_size
- `R9`: mode

**Returns:** 0 if success, < 0 if not.

---

### io_close
**Close a file**

**Inputs:**
- `RDI`: [IO_STREAM](#io_stream)

**Returns:** buff_addr.

---

### io_read
**Read from a file**

**Inputs:**
- `RDI`: [IO_STREAM](#io_stream)
- `RSI`: dest_addr
- `RDX`: n_bytes

**Returns:** n_bytes read.

---

### io_write
**Write to a file**

**Inputs:**
- `RDI`: [IO_STREAM](#io_stream)
- `RSI`: src_addr
- `RDX`: n_bytes

**Returns:** n_bytes written.

---

### io_purge
**Reset pointers of IO_STREAM**

**Inputs:**
- `RDI`: [IO_STREAM](#io_stream)

**Returns:** None.

---

### io_flush
**Flush IO_STREAM buffer**

**Inputs:**
- `RDI`: [IO_STREAM](#io_stream)

**Returns:** None.

---

### io_seek
**Move file pointer**

**Inputs:**
- `RDI`: [IO_STREAM](#io_stream)
- `RSI`: n_bytes
- `RDX`: whence

**Returns:** New pointer position.