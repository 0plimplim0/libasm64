.intel_syntax noprefix

.global q_array_replace
q_array_replace:
  # q_array_replace(rdi = arr_addr | rsi = val | rdx = pos)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov ecx, -1
  cmovnz rax, rcx
  jnz .exit
  cmp dword ptr [rdi+12], 0
  mov ecx, -3
  cmovz rax, rcx
  jz .exit
  cmp edx, dword ptr [rdi+12]
  mov ecx, -4
  cmovae rax, rcx
  jae .exit
  add rdi, 16
  mov qword ptr [rdi+rdx*8], rsi
.exit:
  ret
