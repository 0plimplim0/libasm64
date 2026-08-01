# Core C Runtime

C wrapper interface for the assembly core runtime.

---

## Includes

Include the umbrella core header or individual modules:

```c
#include <core/core.h> // Includes all modules

// Or specific modules:
#include <core/memory.h>
#include <core/io.h>
#include <core/string.h>
#include <core/system.h>
#include <core/array.h>
```

---

## Error & Return Conventions
| Category | Return Value (`rax`) | Sets `_errno` |
| :--- | :--- | :--- |
| **Actions** (`barr_insert`, `free`) | `0` (Success) / `< 0` (Error Code) | No |
| **Allocations** (`barr_new`, `malloc`) | `Pointer` (Success) / `NULL` (on Error) | Yes |
| **Queries** (`barr_get`, `strlen`) | `Value` / `0` (on Error) | Yes |

**Note:** Function `errno()` returns the current _errno state for functions that set it and sets it to 0.

---

## Modules
* [**Memory**](memory.md) — Memory management (`malloc`, `free`, `memcpy`, etc.).
* [**I/O**](io.md) — I/O utilities (`print`, `fread`, `fwrite`, `fopen`).
* [**String**](string.md) — String manipulation and conversions (`strlen`, `strcmp`, `itoa64`, etc.).
* [**System**](system.md) — Kernel syscall wrappers (`syscall`, `exit`).
* Data:
  * [**Array**](data/array.md) — Static arrays (`barr`, `warr`, `darr`, `qarr`).