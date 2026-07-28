.intel_syntax noprefix

.global w_array_free
w_array_free:
  # w_array_free(rdi = arr_addr)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241     # Magic Number
  mov ecx, -1
  cmovne rax, rcx
  jne .exit     # Invalid Magic Number
  cmp byte ptr [rdi+4], 0             # Ownership
  je .exit
  call mem_free
.exit:
  ret
