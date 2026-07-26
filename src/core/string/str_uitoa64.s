.intel_syntax noprefix

.global str_uitoa64
str_uitoa64:
  # str_uitoa64(rdi = integer | rsi = buff_addr)
  # Prologue
  push rbx
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # Temp 1
  xor edx, edx
  mov rax, rdi
  xor edi, edi      # Iterator
  mov ebx, 10
.loop:
  xor edx, edx
  div rbx
  mov rcx, rdx
  add rcx, 0x30
  mov byte ptr [rsi+rdi], cl
  inc edi 
  cmp rax, 0x0
  je .epilogue
  jmp .loop

.epilogue:
  mov rcx, rdi
  mov rdi, rsi
  mov rsi, rcx
  mov byte ptr [rsi+rdi], 0
  call str_rev
  mov rsp, rbp
  pop rbp
  pop rbx
  ret
