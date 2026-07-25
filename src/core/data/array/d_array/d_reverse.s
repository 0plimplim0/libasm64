.intel_syntax noprefix
.global d_array_reverse
d_array_reverse:
  # d_array_reverse(rdi = arr_addr)
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
  xor ecx, ecx
  mov esi, dword ptr [rdi+12]
  dec esi
  add rdi, 16
.loop:
  cmp ecx, esi
  jae .exit
  mov edx, dword ptr [rdi+rcx*4]
  mov r8d, dword ptr [rdi+rsi*4]
  mov dword ptr [rdi+rcx*4], r8d
  mov dword ptr [rdi+rsi*4], edx
  inc ecx
  dec esi
  jmp .loop
.exit:
  ret
