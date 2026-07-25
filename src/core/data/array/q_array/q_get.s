.intel_syntax noprefix
.global q_array_get
q_array_get:
  # q_array_get(rdi = arr_addr | rsi = pos)
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
  mov rax, qword ptr [rdi+rsi*8]
.exit:
  ret
