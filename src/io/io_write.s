.intel_syntax noprefix

.global io_write
io_write:
  # WARNING: For now only supports normal buffers
  # io_write(rdi = IO_STREAM | rsi = data_addr | rdx = data_size)
  # IO_STREAM = 0-7 = FD | 8-15 = buff_addr | 16-23 = buff_counter | 24-27 = buff_size | 28 = buff_own | 29 = buff_type | 30-31 = padding
  # Prologue
  push r12
  push r13
  push r14
  push r15
  push rbp
  mov rbp, rsp
  
  # Setup
  mov r12, rsi      # data_addr
  mov r13, rdi      # IO_STREAM
  mov r14, rdx      # data_size
  xor r15d, r15d   # data_counter
  
  # Check
.loop:
  mov r8d, dword ptr [r13+24]
  sub r8, qword ptr [r13+16]      # buff_size available
  cmp r8d, r14d
  jae .en
  # Here goes code for not enough space in buffer
  mov rdi, r12
  add rdi, r15
  mov rsi, qword ptr [r13+8]
  add rsi, qword ptr [r13+16]
  mov rdx, r8
  add r15, r8     # Increase data_counter
  add qword ptr [r13+16], r8      # Increase buff_counter
  sub r14, r8     # Decrease data_size
  call mem_cpy
  mov rdi, r13
  call io_flush
  jmp .loop

.en:
  mov rsi, qword ptr [r13+8]
  add rsi, qword ptr [r13+16]
  mov rdx, r14
  mov rdi, r12
  add rdi, r15
  call mem_cpy
  add qword ptr [r13+16], r14     # Update buff_counter
  jmp .epilogue

.epilogue:
  mov rsp, rbp
  pop rbp
  pop r15
  pop r14
  pop r13
  pop r12
  ret
