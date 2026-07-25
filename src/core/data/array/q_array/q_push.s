.intel_syntax noprefix
.global q_array_push
q_array_push:
  # q_array_push(rdi = arr_addr | rsi = val)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  mov edx, dword ptr [rdi+12]
  cmp edx, dword ptr [rdi+8]
  mov rcx, -3
  cmovae rax, rcx
  jae .exit
  inc word ptr [rdi+12]
  add rdi, 16
  mov qword ptr [rdi+rdx*8], rsi
.exit:
  ret
