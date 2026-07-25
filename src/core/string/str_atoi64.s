.intel_syntax noprefix

.global str_aatoi64
str_aatoi64:
  # str_atoi64(rdi = str_addr)
  # Prologue
  push rbx
  push rbp
  mov rbp, rsp
  
  xor r8d, r8d
  xor eax, eax      # Sum
  xor ecx, ecx      # Iterator
  mov ebx, 10
  xor esi, esi
  cmp byte ptr [rdi+rcx], 0x2D
  jne .loop
  inc r8d
  inc ecx
.loop:
  mov sil, byte ptr [rdi+rcx]
  cmp sil, 0x0
  je .epilogue
  sub sil, 0x30
  mul rbx
  add rax, rsi
  inc ecx
  jmp .loop

.epilogue:
  cmp r8d, 0
  je .nneg
  neg rax
.nneg:
  mov rsp, rbp
  pop rbp
  pop rbx
  ret
