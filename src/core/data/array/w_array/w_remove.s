.intel_syntax noprefix

.global w_array_remove
w_array_remove:
  # w_array_remove(rdi = arr_addr | rsi = pos)
  # Prologue
  push rbp
  mov rbp, rsp

  sub rdi, 16
  xor eax, eax

  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .epilogue
  cmp dword ptr [rdi+12], 0
  mov rcx, -3
  cmovz rax, rcx
  jz .epilogue
  cmp esi, dword ptr [rdi+12]
  mov rcx, -4
  cmovae rax, rcx
  jae .epilogue
  mov ecx, dword ptr [rdi+12]
  dec ecx
  add rdi, 16
.loop:
  cmp esi, ecx
  jae .endloop
  shr dword ptr [rdi+rsi*2], 16
  inc esi
  jmp .loop
.endloop:
  sub rdi, 16
  dec dword ptr [rdi+12]
.epilogue:
  mov rsp, rbp
  pop rbp
  ret
