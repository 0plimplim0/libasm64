.intel_syntax noprefix
.global d_array_get
d_array_get:
  # d_array_get(rdi = arr_addr | rsi = pos)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  cmp esi, dword ptr [rdi+12]
  mov rcx, -4
  cmovae rax, rcx
  jae .exit
  add rdi, 16
  mov eax, dword ptr [rdi+rsi*4]
.exit:
  ret
