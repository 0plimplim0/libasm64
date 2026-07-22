.intel_syntax noprefix
.global str_cpy
str_cpy:
  # str_cpy(rdi = dest | rsi = src)
  mov rax, rdi
.loop:
  cmp byte ptr [rsi], 0
  je .exit
  mov r8b, byte ptr [rsi]
  mov byte ptr [rdi], r8b
  inc rsi
  inc rdi
  jmp .loop
.exit:
  mov byte ptr [rdi], 0
  ret
