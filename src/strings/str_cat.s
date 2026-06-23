.intel_syntax noprefix

.global str_cat
strcat:
  # str_cat(rdi = dest_addr | rsi = str1_addr | rdx = str2_addr)
  # Prologue
  push rbx
  push r12
  push r13
  push r14
  push rbp
  mov rbp, rsp

  mov r12, rdi      # dest_addr
  mov r13, rsi      # str1_addr
  mov r14, rdx      # str2_addr
  mov rdi, rsi
  xor esi, esi
  call str_len
  mov ebx, eax
  mov rsi, r12
  mov rdi, r13
  mov rdx, rax
  call mem_cpy
  add r12, rbx
  mov rdi, r14
  xor esi, esi
  call str_len
  mov rsi, r12
  mov rdi, r14
  mov edx, eax
  call mem_cpy

  # Epilogue
  mov rsp, rbp
  pop rbp
  pop r14
  pop r13
  pop r12
  pop rbx
  ret
