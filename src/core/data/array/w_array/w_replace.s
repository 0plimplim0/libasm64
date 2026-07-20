.intel_syntax noprefix

.global w_array_replace
w_array_replace:
  # w_array_replace(rdi = arr_addr | rsi = val | rdx = pos)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  cmp dword ptr [rdi+12], 0
  mov rcx, -3
  cmovz rax, rcx
  jz .exit
  cmp edx, dword ptr [rdi+12]
  mov rcx, -4
  cmovae rax, rcx
  jae .exit
  add rdi, 16
  mov word ptr [rdi+rdx*2], si
.exit:
  ret
