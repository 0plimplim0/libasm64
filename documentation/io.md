# IO utils

## Index

- [io_clear](#io_clear)
- [io_error](#io_error)
- [io_print](#io_print)

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

**Returns:** n_bytes written in `RAX`.

---