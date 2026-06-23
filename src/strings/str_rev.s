.intel_syntax noprefix

.global str_rev
str_rev:
  # str_rev(rdi = str_addr | rsi = str_len)
  # Prologue
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # Ptr1
  xor edx, edx      # Temp1
  xor r8d, r8d      # Temp2
  dec esi        # Ptr2
.loop:
  cmp ecx, esi
  jae .epilogue
  mov dl, byte ptr [rdi+rcx]
  mov r8b, byte ptr [rdi+rsi]
  mov byte ptr [rdi+rcx], r8b
  mov byte ptr [rdi+rsi], dl
  inc ecx
  dec esi
  jmp .loop

.epilogue:
  mov rsp, rbp
  pop rbp
  ret
