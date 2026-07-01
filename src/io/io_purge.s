.intel_syntax noprefix

# TODO: Update this to IO_STREAM format
# NEW: io_purge(IO_STREAM)
# Just set IO_STREAM counters to 0

.global io_purge
io_purge:
  # io_purge(rdi = fd)
  # Prologue
  push r12
  push rbp
  mov rbp, rsp
  
  mov r12, rdi
  sub rsp, 256
.loop:
  mov eax, 0
  mov rdi, r12
  mov rsi, rsp
  mov edx, 256
  syscall
  cmp eax, 0
  jbe .prologue
  cmp byte ptr [rsp+rax-1], 0x0A
  je .prologue
  jmp .loop
.prologue:
  mov rsp, rbp
  pop rbp
  pop r12
  ret
