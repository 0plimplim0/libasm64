.intel_syntax noprefix

.global io_clear
io_clear:
  # io_clear() NO ARGS
  # Prologue
  push rbp
  mov rbp, rsp

  sub rsp, 8
  mov rax, 0x00485B1B4A325B1B 
  mov [rsp], rax
  mov eax, 1
  mov edi, 1
  mov rsi, rsp
  mov edx, 7
  syscall

  # Epilogue
  mov rsp, rbp
  pop rbp
  ret
