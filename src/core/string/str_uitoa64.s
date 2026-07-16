.intel_syntax noprefix

.global str_uitoa64
str_uitoa64:
  # WARNING: Currently only supports 16-bit nums
  # str_uitoa64(rdi = integer | rsi = buff_addr)
  # Prologue
  push rbx
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # Temp 1
  xor edx, edx
  mov eax, edi
  xor edi, edi      # Iterator
  mov bl, 10
.loop:
  div bl
  mov cl, ah
  add cl, 0x30
  mov byte ptr [rsi+rdi], cl
  inc edi 
  cmp al, 0x0
  je .epilogue
  movzx ax, al
  jmp .loop

.epilogue:
  mov rcx, rdi
  mov rdi, rsi
  mov rsi, rcx
  call str_rev
  mov rsp, rbp
  pop rbp
  pop rbx
  ret
