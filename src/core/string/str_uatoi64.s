.intel_syntax noprefix

.global str_uatoi64
str_uatoi64:
  # str_atoi64(rdi = str_addr)
  # Prologue
  push rbx
  push rbp
  mov rbp, rsp

  xor eax, eax      # Sum
  xor ecx, ecx      # Iterator
  mov ebx, 10
  xor esi, esi
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
  mov rsp, rbp
  pop rbp
  pop rbx
  ret
