.intel_syntax noprefix
.global q_array_size
q_array_size:
  # q_array_size(rdi = arr_addr)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov ecx, -1
  jnz .err
  mov eax, dword ptr [rdi+12]
.exit:
  ret
.err:
  mov dword ptr [_errno+rip], ecx
  ret
  