.intel_syntax noprefix

.global mem_set
mem_set:
  # mem_set(rdi = src_addr | rsi = n_bytes | rdx = byte)
  # Prologue
  push rbp
  mov rbp, rsp
  
  # Setup
  xor ecx, ecx      # Iterator
  mov rax, 0x0101010101010101
  imul rax, rdx     # RAX = Container(?)
  mov r8, rsi      # Temp

.loop:
  cmp rcx, rsi
  jae .epilogue
  cmp r8, 8
  jb .n64b
  mov [rdi+rcx], rax
  add rcx, 8
  sub r8, 8
  jmp .loop
.n64b:
  mov byte ptr [rdi+rcx], al
  inc rcx
  jmp .loop

.epilogue:
  mov rax, rcx
  mov rsp, rbp
  pop rbp
  ret
