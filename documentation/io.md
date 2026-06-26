# IO utils

## Index

- [io_clear](#io_clear)
- [io_error](#io_error)
- [io_flush](#io_flush)
- [io_print](#io_print)
- [io_purge](#io_purge)
- [io_read](#io_read)
- [io_write](#io_write)

## Structures

### IO_STREAM
**32 bytes**: (0-7 = FD | 8-15 = buff_addr | 16-23 = counter | 24-27 =  buff_size | 28 = buff_own | 29 = buff_type | 30-31 = padding)

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

### io_flush
**Flushes the buffer to its file descriptor.**

**Inputs:**
- `RDI`: [IO_STREAM_addr](#io_stream)

**Returns:** n_bytes flushed in `RAX`.

---

### io_print
**Sends a string to stdout**

**Inputs:**
- `RDI`: str_addr
- `RSI`: str_len

**Returns:** n_bytes written in `RAX`.

---

### io_purge
**Discards all unread bytes from an FD's input.**

**Inputs:**
- `RDI`: FD

**Returns:** None.

---

### io_read
**Reads from stdin**

**Inputs:**
- `RDI`: buff_addr
- `RSI`: buff_len

**Returns:** n_bytes read in `RAX`.

---

### io_write
**Writes data to a IO_STREAM buffer**

**Inputs:**
- `RDI`: [IO_STREAM_addr](#io_stream)
- `RSI`: data_addr
- `RDX`: data_size

**Returns:** None. (Modifies **IO_STREAM** buffer)

---