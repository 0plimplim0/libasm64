.intel_syntax noprefix
.global w_array_clear
w_array_clear:
  # w_array_clear(rdi = arr_addr)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  mov dword ptr [rdi+12], 0
.exit:
  ret
