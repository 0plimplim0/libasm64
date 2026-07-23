.intel_syntax noprefix

.global io_open
io_open:
  # io_open(rdi = filename_addr | rsi = flags | rdx = IO_STREAM_addr | rcx = buff_addr | r8 = buff_size | r9 = mode)
  # Prologue
  push r12
  push r13
  push r14
  push rbp
  mov rbp, rsp
  
  mov r12, rcx      # buff_addr
  mov r13, r8       # buff_size
  mov r14, rdx      # IO_STREAM_addr
  mov rdx, r9       # mode
  test rsi, 0x40      # 0_CREAT
  xor ecx, ecx
  cmovz edx, ecx
  mov eax, 2
  syscall
  cmp rax, 0
  jl .epilogue
  mov dword ptr [r14], eax      # FD
  mov qword ptr [r14+4], r12    # buff_addr
  mov qword ptr [r14+12], 0     # Write/Read ptrs (4 | 4)
  mov dword ptr [r14+20], r13d   # buff_size
  # Rest of bytes not used for now
  mov qword ptr [r14+24], 0     # The remaining bytes are not used for now
  xor eax, eax

.epilogue:
  mov rsp, rbp
  pop rbp
  pop r14
  pop r13
  pop r12
  ret
