.intel_syntax noprefix

.global str_split
str_split:
  # str_split(rdi = dest_addr | rsi = str_addr | rdx = char)
  
  xor eax, eax
  xor r8d, r8d      # Temp1
  mov [rdi], rsi
  add rdi, 8
  inc eax
.loop:
  mov r8b, byte ptr [rsi]
  test r8b, r8b
  jz .exit
  cmp r8b, dl
  je .equal
  inc rsi
  jmp .loop
.equal:
  mov byte ptr [rsi], 0x0
  inc rsi
  cmp byte ptr [rsi], 0
  jz .exit
  mov qword ptr [rdi], rsi
  add rdi, 8
  inc eax
  jmp .loop
.exit:
  ret
