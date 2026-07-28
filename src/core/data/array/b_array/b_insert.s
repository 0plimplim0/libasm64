.intel_syntax noprefix
.global b_array_insert
b_array_insert:
  # b_array_insert(rdi = arr_addr | rsi = val(1byte) | rdx = pos)
  # Prologue
  push rbp
  mov rbp, rsp

  sub rdi, 16
  xor eax, eax
  
  # Magic validation
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .epilogue
  
  # Size validation
  mov r8d, dword ptr [rdi+8]
  cmp dword ptr [rdi+12], r8d
  mov rcx, -3
  cmovz rax, rcx
  jz .epilogue
  
  # Pos validation
  mov r8d, dword ptr [rdi+12]
  cmp edx, r8d
  mov rcx, -4
  cmova rax, rcx
  ja .epilogue

  mov ecx, dword ptr [rdi+12]
  add rdi, 16
  test ecx, ecx
  jz .endloop
  dec ecx
.loop:
  cmp ecx, edx
  jl .endloop
  shl word ptr [rdi+rcx], 8
  dec ecx
  jmp .loop
.endloop:
  mov byte ptr [rdi+rdx], sil
  sub rdi, 16
  inc dword ptr [rdi+12]

.epilogue:
  mov rsp, rbp
  pop rbp
  ret
