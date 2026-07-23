.intel_syntax noprefix

.global io_read
io_read:
  # io_read(rdi = IO_STREAM | rsi = dest_addr | rdx = n_bytes)
  # Prologue
  push r12
  push r13
  push r14
  push r15
  push rbp
  mov rbp, rsp

  xor r15d, r15d
  xor r8d, r8d
  mov r12, rdi      # IO_STREAM
  mov eax, dword ptr [r12+20]
  mov r13, rsi      # dest_addr
  mov r14, rdx      # n_bytes
  mov esi, dword ptr [r12+12]     # write_ptr
  sub esi, dword ptr [r12+16]     # read_ptr
  cmp r14d, esi
  ja .nen
  mov rsi, r13
  mov rdi, qword ptr [r12+4]      # buff_addr
  mov edx, dword ptr [r12+16]     # read_ptr
  add rdi, rdx
  mov edx, r14d
  add dword ptr [r12+16], edx
  call mem_cpy
  mov r15d, r14d
  jmp .epilogue

.nen:
  mov rsi, r13
  mov rdi, qword ptr [r12+4]      # buff_addr
  mov edx, dword ptr [r12+16]     # read_ptr
  add rdi, rdx
  mov edx, dword ptr [r12+12]
  sub edx, dword ptr [r12+16]
  cmp edx, r14d
  cmova edx, r14d
  add r13, rdx
  sub r14d, edx
  add dword ptr [r12+16], edx
  add r15d, edx
  cmp eax, dword ptr [r12+20]
  cmovb r14d, r8d
  call mem_cpy
  test r14d, r14d
  jz .epilogue
  mov rdi, r12
  call io_purge
  mov eax, 0
  mov edi, dword ptr [r12]
  mov rsi, qword ptr [r12+4]
  mov edx, dword ptr [r12+20]
  syscall
  cmp eax, 0
  jle .epilogue
  add dword ptr [r12+12], eax
  jmp .nen
.epilogue:
  mov edi, dword ptr [r12+20]
  cmp dword ptr [r12+12], edi
  jb .nf
  mov dword ptr [r12+20], 0
.nf:
  cmp rax, 0
  cmovge eax, r15d
  mov rsp, rbp
  pop rbp
  pop r15
  pop r14
  pop r13
  pop r12
  ret