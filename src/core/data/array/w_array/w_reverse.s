.intel_syntax noprefix
.global w_array_reverse
w_array_reverse:
  # w_array_reverse(rdi = arr_addr)
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
  mov dx, word ptr [rdi+rcx*2]
  mov r8w, word ptr [rdi+rsi*2]
  mov word ptr [rdi+rcx*2], r8w
  mov word ptr [rdi+rsi*2], dx
  inc ecx
  dec esi
  jmp .loop
.exit:
  ret
