.intel_syntax noprefix
.global io_scan
io_scan:
  # io_scan(rdi = buff | rsi = n_bytes)
  mov rdx, rsi
  mov rsi, rdi
  xor edi, edi
  xor eax, eax
  syscall
  ret
