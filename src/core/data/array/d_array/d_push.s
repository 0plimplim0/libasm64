.intel_syntax noprefix
.global d_array_push
d_array_push:
  # d_array_push(rdi = arr_addr | rsi = val)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov ecx, -1
  cmovnz rax, rcx
  jnz .exit
  mov edx, dword ptr [rdi+12]
  cmp edx, dword ptr [rdi+8]
  mov rcx, -3
  cmovae rax, rcx
  jae .exit
  inc dword ptr [rdi+12]
  add rdi, 16
  mov dword ptr [rdi+rdx*4], esi
.exit:
  ret
