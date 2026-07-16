.intel_syntax noprefix

.global io_write
io_write:
  # io_write(rdi = IO_STREAM | rsi = src_addr | rdx = n_bytes)
  # Prologue
  push r12
  push r13
  push r14
  push rbp
  mov rbp, rsp

  mov r12, rdi      # IO_STREAM
  mov r13, rsi      # src_addr
  mov r14, rdx      # n_bytes
  mov esi, dword ptr [r12+20]     # buff_size
  sub esi, dword ptr [r12+12]     # write_ptr
  cmp r14d, esi
  ja .nen
  mov rdi, r13      # src_addr
  mov rsi, qword ptr [r12+4]      # buff_addr
  mov edx, dword ptr [r12+12]
  add rsi, rdx
  mov edx, r14d     # n_bytes
  add dword ptr [r12+12], edx
  call mem_cpy
  jmp .epilogue

.nen:
  # Here goes the loop code
  mov rdi, r13
  mov rsi, qword ptr [r12+4]      # buff_addr
  mov edx, dword ptr [r12+12]     # write_ptr
  add rsi, rdx
  mov edx, dword ptr [r12+20]     # buff_size
  sub edx, dword ptr [r12+12]
  cmp edx, r14d
  cmova edx, r14d
  sub r14d, edx
  add r13, rdx
  add dword ptr [r12+12], edx
  call mem_cpy
  test r14d, r14d
  jz .epilogue
  mov rdi, r12
  call io_flush
  jmp .nen

.epilogue:
  mov rsp, rbp
  pop rbp
  pop r14
  pop r13
  pop r12
  ret
