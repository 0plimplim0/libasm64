.intel_syntax noprefix

.global b_array_free
b_array_free:
  # b_array_free(rdi = arr_addr)
  # Prologue
  push rbp
  mov rbp, rsp

  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241     # Magic Number
  mov rcx, -1
  cmovne rax, rcx
  jne .epilogue     # Invalid Magic Number
  cmp byte ptr [rdi+4], 0             # Ownership
  je .epilogue
  call mem_free
  xor eax, eax
.epilogue:
  mov rsp, rbp
  pop rbp
  ret
