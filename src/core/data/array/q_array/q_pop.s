.intel_syntax noprefix
.global q_array_pop
q_array_pop:
  # q_array_pop(rdi = arr_addr)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov ecx, -1
  jnz .err
  mov edx, dword ptr [rdi+12]
  test edx, edx
  mov ecx, -3
  jz .err
  dec dword ptr [rdi+12]
  dec edx
  add rdi, 16
  mov rax, qword ptr [rdi+rdx*8]
.exit:
  ret
.err:
  mov dword ptr [_errno+rip], ecx
  ret
