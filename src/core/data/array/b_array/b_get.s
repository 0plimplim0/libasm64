.intel_syntax noprefix
.global b_array_get
b_array_get:
  # b_array_get(rdi = arr_addr | rsi = pos)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov ecx, -1
  jnz .err
  cmp esi, dword ptr [rdi+12]
  mov ecx, -4
  jae .err
  add rdi, 16
  mov al, byte ptr [rdi+rsi]
.exit:
  ret
.err:
  mov dword ptr [_errno+rip], ecx
  ret