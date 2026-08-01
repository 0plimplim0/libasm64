# System utils

## Index

**[Go back to modules](index.md).**

- [sys_exit](#sys_exit)
- [sys_call](#sys_call)

## Functions

### sys_exit
**Exits the program with an exit code**

**Inputs:**
- `RDI`: exit_code

**Returns:** None. (Never returns)
---

### sys_call
**Executes a raw syscall**

**Inputs:**
- `RDI`: number
- `RSI`: arg1
- `RDX`: arg2
- `RCX`: arg3
- `R8`: arg4
- `R9`: arg5
- `Stack`: arg6
**Returns:** Syscall output
**Note:** This function is useless in assembly, is inteded to be used in C.