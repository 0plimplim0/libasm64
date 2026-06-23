.intel_syntax noprefix

.global str_strip
str_strip:
  # str_strip(rdi = str_addr | rsi = char)
  # Prologue
  push rbp
  mov rbp, rsp

  xor ecx, ecx      # Ptr1
  xor eax, eax      # Ptr2
  xor r8d, r8d      # Temp
.loop:
  mov r8b, byte ptr [rdi+rax]
  test r8b, r8b
  jz .strend
  cmp r8b, sil
  jne .neq
  inc eax
  jmp .loop
.neq:
  mov byte ptr [rdi+rcx], r8b
  inc ecx
  inc eax
  jmp .loop
.strend:
  mov byte ptr [rdi+rcx], 0x0
  # Epilogue
  mov rsp, rbp
  pop rbp
  ret
