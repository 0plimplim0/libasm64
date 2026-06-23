.intel_syntax noprefix


.global str_tolower_raw
str_tolower_raw:
  # str_tolower_raw(rdi = str_addr | rsi = str_len)
  # Prologue
  push rbp
  mov rbp, rsp

  xor ecx, ecx      # Iterator
  mov rax, 0x2020202020202020
  mov r8d, esi      # Temp
.loop:
  cmp ecx, esi
  jae .epilogue
  cmp r8d, 8
  jb .n64b
  or [rdi+rcx], rax
  add ecx, 8
  sub r8d, 8
  jmp .loop
.n64b:
  or byte ptr [rdi+rcx], al
  inc ecx
  jmp .loop

.epilogue:
  mov rsp, rbp
  pop rbp
  ret
