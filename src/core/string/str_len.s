.intel_syntax noprefix

.global str_len
str_len:
  # str_len(rdi = str_addr | rsi = limiter(default=0x0))
  #Prologue
  push rbp
  mov rbp, rsp

  xor eax, eax      # iterator
.loop:
  cmp byte ptr [rdi+rax], sil
  je .end
  inc eax
  jmp .loop
.end:
  mov rsp, rbp
  pop rbp
  ret
