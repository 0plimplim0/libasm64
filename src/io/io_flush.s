.intel_syntax noprefix

.global io_flush
io_flush:
  # io_flush(rdi = struct_addr)
  # struct: 0-7 = fd | 8-15 = buff_addr | 16-23 = counter | 24-31 = buff_size
  
  # Prologue
  push r12
  push rbp
  mov rbp, rsp

  cmp qword ptr [rdi+16], 0
  je .epilogue

  mov r12, rdi
  mov eax, 1
  mov rdi, qword ptr [r12]
  mov rsi, qword ptr [r12+8]
  mov rdx, qword ptr [r12+16]
  syscall
  mov qword ptr [r12+16], 0

.epilogue:
  mov rsp, rbp
  pop rbp
  pop r12
  ret
