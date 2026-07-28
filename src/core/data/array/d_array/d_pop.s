.intel_syntax noprefix
.global d_array_pop
d_array_pop:
  # d_array_pop(rdi = arr_addr)
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
  mov eax, dword ptr [rdi+rdx*4]
.exit:
  ret
.err:
  mov dword ptr [_errno+rip], ecx
  ret
