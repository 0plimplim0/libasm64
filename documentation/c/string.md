# String utils

## Index

**[Go back to modules](index.md).**

- [strlen](#strlen)
- [strcat](#strcat)
- [strchr](#strchr)
- [strcmp](#strcmp)
- [strcpy](#strcpy)
- [strrev](#strrev)
- [strsplit](#strsplit)
- [strstrip](#strstrip)
- [tolower](#tolower)
- [tolower_raw](#tolower_raw)
- [toupper](#toupper)
- [toupper_raw](#toupper_raw)
- [atoi64](#atoi64)
- [uatoi64](#uatoi64)
- [itoa64](#itoa64)
- [uitoa64](#uitoa64)

## Functions

### strlen
**Gets string length.**

**Parameters:**
- `const char *s`: str_addr

**Returns:** String length.

---

### strcat
**Concatenates 2 strings.**

**Parameters:**
- `char *dest`: dest_addr
- `const char *s1`: str1_addr
- `const char *s2`: str2_addr

**Returns:** None. (Modifies **dest**)

---

### strchr
**Searches for a character in a string.**

**Parameters:**
- `const char *s`: str_addr
- `char v`: char

**Returns:** An offset pointing to the character position if found, `-1` if not.

---

### strcmp
**Compares 2 strings.**

**Parameters:**
- `const char *s1`: str1_addr
- `const char *s2`: str2_addr
- `uint32_t limit`: character_limit

**Returns:** `0` if equal, `-1` if not.

---

### strcpy
**Copies a string.**

**Parameters:**
- `char *dest`: dest_addr
- `const char *src`: src_addr

**Returns:** None. (Modifies **dest**)

---

### strrev
**Reverses a string.**

**Parameters:**
- `char *s`: str_addr

**Returns:** None. (Modifies **s**)

---

### strsplit
**Splits a string by character.**

**Parameters:**
- `void *dest`: dest_addr
- `char *s`: str_addr
- `char c`: delimiter_char

**Returns:** Number of tokens generated.
**Note:** Destroys/modifies `s` during tokenization.

---

### strstrip
**Removes all occurrences of a character in a string.**

**Parameters:**
- `char *s`: str_addr
- `char v`: char

**Returns:** Number of characters removed. (Modifies **s**)

---

### tolower
**Turns all uppercase characters into lowercase.**

**Parameters:**
- `char *s`: str_addr

**Returns:** None. (Modifies **s**)

---

### tolower_raw
**Turns all characters of a string into lowercase.**

**Parameters:**
- `char *s`: str_addr

**Returns:** None. (Modifies **s**)

---

### toupper
**Turns all lowercase characters into uppercase.**

**Parameters:**
- `char *s`: str_addr

**Returns:** None. (Modifies **s**)

---

### toupper_raw
**Turns all characters of a string into uppercase.**

**Parameters:**
- `char *s`: str_addr

**Returns:** None. (Modifies **s**)

---

### atoi64
**Converts an ASCII string into a signed 64-bit integer.**

**Parameters:**
- `const char *s`: str_addr

**Returns:** Signed 64-bit integer.

---

### uatoi64
**Converts an ASCII string into an unsigned 64-bit integer.**

**Parameters:**
- `const char *s`: str_addr

**Returns:** Unsigned 64-bit integer.

---

### itoa64
**Converts a signed 64-bit integer into ASCII.**

**Parameters:**
- `int64_t i`: integer
- `char *s`: dest_addr

**Returns:** None. (Modifies **s**)

---

### uitoa64
**Converts an unsigned 64-bit integer into ASCII.**

**Parameters:**
- `uint64_t i`: integer
- `char *s`: dest_addr

**Returns:** None. (Modifies **s**)