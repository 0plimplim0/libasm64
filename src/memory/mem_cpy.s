.intel_syntax noprefix

.global mem_cpy
mem_cpy:
  # mem_cpy(rdi = src_addr | rsi = dest_addr | rdx = n_bytes)
  # Prologue
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # Iterator
  mov r8, rdx       # Temp
.loop:
  cmp rcx, rdx
  jae .epilogue
  cmp r8, 8
  jb .n64b
  mov rax, [rdi+rcx]
  mov [rsi+rcx], rax
  add rcx, 8
  sub r8, 8
  jmp .loop
.n64b:
  mov al, byte ptr [rdi+rcx]
  mov byte ptr [rsi+rcx], al
  inc rcx
  jmp .loop

.epilogue:
  mov rsp, rbp
  pop rbp
  ret
