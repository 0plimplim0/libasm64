.intel_syntax noprefix

.global str_itoa64
str_itoa64:
  # str_itoa64(rdi = integer | rsi = buff_addr)
  push rbx
  push rbp
  mov rbp, rsp
  
  xor r8d, r8d
  cmp rdi, 0
  jge .nneg1
  inc r8d
  neg rdi
.nneg1:
  xor ecx, ecx      # Temp 1
  xor edx, edx
  mov rax, rdi
  xor edi, edi      # Iterator
  mov ebx, 10
.loop:
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
  cmp r8d, 0
  je .nneg2
  mov byte ptr [rsi+rdi], 0x2D
  inc edi
.nneg2:
  mov byte ptr [rsi+rdi], 0
  call str_rev
  mov rsp, rbp
  pop rbp
  pop rbx
  ret
