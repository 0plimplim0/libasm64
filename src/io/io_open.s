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
  cmovz rdx, 0
  mov eax, 2
  syscall
