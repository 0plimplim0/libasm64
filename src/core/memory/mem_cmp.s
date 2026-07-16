.intel_syntax noprefix

.global mem_cmp
mem_cmp:
  # mem_cmp(rdi = addr1 | rsi = addr2 | rdx = addr_len)
  # Prologue
  push rbp
  mov rbp, rsp

  xor ecx, ecx      # Iterator
  mov r8, rdx       # Temp
  xor eax, eax
  xor r9d, r9d
.loop:
  cmp rcx, rdx
  jae .epilogue
  cmp r8, 8
  jb .n64b
  mov rax, [rdi+rcx]
  sub rax, [rsi+rcx]
  jnz .nequal
  add rcx, 8
  sub r8, 8
  jmp .loop
.n64b:
  mov al, byte ptr [rdi+rcx]
  sub al, byte ptr [rsi+rcx]
  jnz .nequal
  inc rcx
  jmp .loop

.epilogue:
  mov eax, r9d
  mov rsp, rbp
  pop rbp
  ret
.nequal:
  mov r9d, -1
  jmp .epilogue
