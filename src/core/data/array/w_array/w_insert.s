.intel_syntax noprefix
.global w_array_insert
w_array_insert:
  # w_array_insert(rdi = arr_addr | rsi = val(1byte) | rdx = pos)
  sub rdi, 16
  xor eax, eax
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  mov r8d, dword ptr [rdi+8]
  cmp dword ptr [rdi+12], r8d
  mov rcx, -3
  cmovz rax, rcx
  jz .exit
  mov r8d, dword ptr [rdi+12]
  cmp edx, r8d
  mov rcx, -4
  cmovae rax, rcx
  jae .exit
  mov ecx, dword ptr [rdi+12]
  dec ecx
  add rdi, 16
.loop:
  cmp ecx, edx
  jb .endloop
  shl dword ptr [rdi+rcx*2], 16
  dec ecx
  jmp .loop
.endloop:
  mov word ptr [rdi+rdx*2], si
  sub rdi, 16
  inc dword ptr [rdi+12]
.exit:
  ret
