.intel_syntax noprefix

.global io_print
io_print:
  # io_print(rdi = str_addr | rsi = str_len)
  # Prologue
  push r13
  push rbp
  mov rbp, rsp
  
  mov r13, rdi      # str_addr
  test rsi, rsi
  jnz .nz
  call str_len
  mov rsi, rax
.nz:
  mov eax, 1
  mov edi, 1
  mov rdx, rsi
  mov rsi, r13
  syscall

  # Epilogue
  mov rsp, rbp
  pop rbp
  pop r13
  ret
