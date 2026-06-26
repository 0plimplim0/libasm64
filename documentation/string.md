# String utils

## Index
- [str_cat](#str_cat)
- [str_chr](#str_chr)
- [str_cmp](#str_cmp)
- [str_len](#str_len)
- [str_rev](#str_rev)
- [str_split](#str_split)
- [str_strip](#str_strip)
- [str_tolower](#str_tolower)
- [str_tolower_raw](#str_tolower_raw)
- [str_toupper](#str_toupper)
- [str_toupper_raw](#str_toupper_raw)
- [str_uatoi64](#str_uatoi64)
- [str_uitoa64](#str_uitoa64)

## Functions

### str_cat
**Concatenates 2 strings**

**Inputs:**
- `RDI`: dest_addr
- `RSI`: str1_addr
- `RDX`: str2_addr

**Returns:** None. (Modifies **dest_addr**)

---

### str_chr
**Searches for a character in a string**

**Inputs:**
- `RDI`: str_addr
- `RSI`: char

**Returns:** An offset in `RAX` pointing to the char position if it is found, -1 if not.

---

### str_cmp
**Compares 2 strings**

**Inputs:**
- `RDI`: str1_addr
- `RSI`: str2_addr
- `RDX`: limit (default=no_limit)

**Returns:** **0** in `RAX` if equal, -1 if not.

---

### str_len
**Gets string length**

**Inputs:**
- `RDI`: str_addr
- `RSI`: char_limiter (default=0x0)

**Returns:** String length in `RAX`.

---

### str_rev
**Reverses a string**

**Inputs:**
- `RDI`: str_addr
- `RSI`: str_len

**Returns:** None. (Modifies **str_addr**)

---

### str_split
**Splits a string**

**Inputs:**
- `RDI`: dest_addr
- `RSI`: str_addr
- `RDX`: char (default=0x20)

**Returns:** None. (Modifies **dest_addr**)

---

### str_strip
**Removes all coincidences of a character in a string**

**Inputs:**
- `RDI`: str_addr
- `RSI`: char

**Returns:** None. (Modifies **str_addr**)

---

### str_tolower
**Turns all uppercase characters into lowercase**

**Inputs:**
- `RDI`: str_addr

**Returns:** None. (Modifies **str_addr**)

---

### str_tolower_raw
**Turns all characters of a string into lowercase**

**Inputs:**
- `RDI`: str_addr
- `RSI`: str_len

**Returns:** None. (Modifies **str_addr**)

---

### str_toupper
**Turns all lowercase characters into uppercase**

**Inputs:**
- `RDI`: str_addr

**Returns:** None. (Modifies **str_addr**)

---

### str_toupper_raw
**Turns all characters of a string into uppercase**

**Inputs:**
- `RDI`: str_addr
- `RSI`: str_len

**Returns:** None. (Modifies **str_addr**)

---

### str_uatoi64
**Converts an ascii number into a 64bit integer**

**Inputs:**
- `RDI`: str_addr

**Returns:** integer in `RAX`.

---

### str_uitoa64
**Converts an 64bits integer into ascii**

**Inputs:**
- `RDI`: integer
- `RSI`: dest_addr

**Returns:** None. (Modifies **dest_addr**)

---