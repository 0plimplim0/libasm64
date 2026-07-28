.intel_syntax noprefix

.global b_array_free
b_array_free:
  # b_array_free(rdi = arr_addr)
  sub rdi, 16
  xor eax, eax
  cmp dword ptr [rdi], 0x59525241     # Magic Number
  mov ecx, -1
  cmovne rax, rcx
  jne .epilogue     # Invalid Magic Number
  cmp byte ptr [rdi+4], 0             # Ownership
  je .epilogue
  call mem_free
.epilogue:
  ret
