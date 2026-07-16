.intel_syntax noprefix

.global b_array_replace
b_array_replace:
  # b_array_replace(rdi = arr_addr | rsi = val | rdx = pos)
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
  mov byte ptr [rdi+rdx], sil
.exit:
  ret
