.intel_syntax noprefix

.global io_seek
io_seek:
  # io_seek(rdi = IO_STREAM | rsi = n_bytes | rdx = whence)
  # Prologue
  push r12
  push r13
  push r14
  push rbp
  mov rbp, rsp

  mov r12, rdi
  mov r13, rsi
  mov r14d, edx
  call io_flush
  mov rdi, r12
  call io_purge
  mov eax, 8
  mov edi, dword ptr [r12]
  mov rsi, r13
  mov edx, r14d
  syscall

  # Epilogue
  mov rsp, rbp
  pop rbp
  pop r14
  pop r13
  pop r12
  ret
