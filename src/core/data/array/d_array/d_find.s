.intel_syntax noprefix
.global d_array_find
d_array_find:
  # d_array_find(rdi = arr_addr | rsi = val)
  sub rdi, 16
  xor eax, eax
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  cmp dword ptr [rdi+12], 0
  mov rcx, -3
  cmovz rax, rcx
  jz .exit
  xor ecx, ecx
  mov edx, dword ptr [rdi+12]
  add rdi, 16
  mov rax, -4
.loop:
  cmp ecx, edx
  jae .exit
  cmp esi, dword ptr [rdi+rcx*4]
  cmovz eax, ecx
  jz .exit
  inc ecx
  jmp .loop
.exit:
  ret
