.intel_syntax noprefix
.global b_array_find
b_array_find:
  # b_array_find(rdi = arr_addr | rsi = val)
  sub rdi, 16
  xor eax, eax
  cmp dword ptr [rdi], 0x59525241
  mov ecx, -1
  jnz .err
  cmp dword ptr [rdi+12], 0
  mov ecx, -3
  jz .err
  xor ecx, ecx
  mov edx, dword ptr [rdi+12]
  add rdi, 16
  mov rax, -4
.loop:
  cmp ecx, edx
  jae .exit
  cmp sil, byte ptr [rdi+rcx]
  cmovz eax, ecx
  jz .exit
  inc ecx
  jmp .loop
.exit:
  ret
.err:
  mov dword ptr [_errno+rip], ecx
  ret
