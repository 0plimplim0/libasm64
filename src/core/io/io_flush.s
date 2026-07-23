.intel_syntax noprefix

.global io_flush
io_flush:
  # io_flush(rdi = IO_STREAM)
  # Prologue
  push r12
  push rbp
  mov rbp, rsp
  
  mov r12, rdi
  mov r8d, dword ptr [r12+12]      # write_ptr
  test r8d, r8d
  jz .epilogue
  cmp r8d, dword ptr [r12+16]
  je .epilogue
  mov eax, 1
  mov edi, dword ptr [r12]        # fd
  mov rsi, qword ptr [r12+4]      # buff_addr
  mov r9d, dword ptr [r12+16]
  add rsi, r9
  mov edx, r8d
  sub edx, r9d
  syscall
.epilogue:
  mov qword ptr [r12+12], 0
  mov rsp, rbp
  pop rbp
  pop r12
  ret
