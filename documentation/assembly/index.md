# Core Runtime

## Calling Convention (System V ABI)

* **Arguments:** `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`
* **Return Value:** `rax` / `eax`
* **Callee-Saved:** `rbx`, `rsp`, `rbp`, `r12`, `r13`, `r14`, `r15`
* **Caller-Saved:** `rax`, `rcx`, `rdx`, `rsi`, `rdi`, `r8`, `r9`, `r10`, `r11`

---

## Error & Return Conventions

| Category | Return Value (`rax`) | Sets `_errno` |
| :--- | :--- | :--- |
| **Actions** (`b_array_insert`, `mem_free`) | `0` (Success) / `< 0` (Error Code) | No |
| **Allocations** (`b_array_new`, `mem_alloc`) | `Pointer` (Success) / `0` (on Error) | Yes |
| **Queries** (`b_array_get`, `str_len`) | `Value` / `0` (on Error) | Yes |

**Note:** Function `errno` returns _errno and resets _errno. For functions that sets _errno.

---

## Modules

* **[Memory](memory.md)** — Memory management (`mem_alloc`, `mem_free`, `mem_cpy`, etc.).
* **[I/O](io.md)** — I/O utilities (`io_print`, `io_read`, `io_write`, `io_open`).
* **[String](string.md)** — String manipulation and conversions (`str_len`, `str_cmp`, `str_itoa64`, etc.).
* **[System](system.md)** — Kernel syscall wrappers (`sys_call`, `sys_exit`).
* **Data:**
  * **[Array](data/array.md)** — Static arrays (`b_array`, `w_array`, `d_array`, `q_array`).