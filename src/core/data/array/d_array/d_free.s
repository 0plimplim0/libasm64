.intel_syntax noprefix

.global d_array_free
d_array_free:
  # d_array_free(rdi = arr_addr)
  sub rdi, 16
  xor eax, eax
  cmp dword ptr [rdi], 0x59525241     # Magic Number
  mov rcx, -1
  cmovne rax, rcx
  jne .exit     # Invalid Magic Number
  cmp byte ptr [rdi+4], 0             # Ownership
  je .exit
  call mem_free
.exit:
  ret
