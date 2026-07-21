.intel_syntax noprefix

.global str_len
str_len:
  # str_len(rdi = str_addr)
  #Prologue
  push rbp
  mov rbp, rsp

  xor eax, eax      # iterator
.loop:
  cmp byte ptr [rdi+rax], 0
  je .end
  inc eax
  jmp .loop
.end:
  mov rsp, rbp
  pop rbp
  ret
