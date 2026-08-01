# System utils

## Index

**[Go back to modules](index.md).**

- [exit](#exit)
- [syscall](#syscall)

## Functions

### exit
**Exits the program with an exit code.**

**Parameters:**
- `int exit_code`: exit_code

**Returns:** None. (Never returns)

---

### syscall
**Executes a raw kernel syscall.**

**Parameters:**
- `uint64_t n`: syscall_number
- `...`: arguments (up to 6 arguments)

**Returns:** Syscall output.
**Note:** Cast pointer arguments to `(void*)` or `uint64_t` as needed.