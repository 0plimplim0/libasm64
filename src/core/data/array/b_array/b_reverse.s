.intel_syntax noprefix
.global b_array_reverse
b_array_reverse:
  # b_array_reverse(rdi = arr_addr)
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
  mov dl, byte ptr [rdi+rcx]
  mov r8b, byte ptr [rdi+rsi]
  mov byte ptr [rdi+rcx], r8b
  mov byte ptr [rdi+rsi], dl
  inc ecx
  dec esi
  jmp .loop
.exit:
  ret
