.intel_syntax noprefix

.global str_chr
str_chr:
  # str_chr(rdi = str_addr | rsi = char_obj) | Returns offset
  # Prologue
  push rbp
  mov rbp, rsp
  
  xor eax, eax      # iterator
.loop:
  cmp byte ptr [rdi+rax], sil
  je .epilogue
  inc eax
  jmp .loop

.epilogue:
  mov rsp, rbp
  pop rbp
  ret
