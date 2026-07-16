.intel_syntax noprefix
.global b_array_size
b_array_size:
  # b_array_size(rdi = arr_addr)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  mov eax, dword ptr [rdi+12]
.exit:
  ret
