.intel_syntax noprefix

.global io_read
io_read:
  # io_read(rdi = buff_addr | rsi = buff_len)
  # Prologue
  push rbp
  mov rbp, rsp

  test esi, esi
  jz .nl
  
  mov rdx, rsi
  mov rsi, rdi
  xor edi, edi
  xor eax, eax
  syscall

  #Epilogue
  mov rsp, rbp
  pop rbp
  ret
.nl:
  mov edi, -15
  call io_exit
