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
  cmova rax, rcx
  ja .exit
  mov ecx, dword ptr [rdi+12]
  add rdi, 16
  test ecx, ecx
  jz .endloop
  dec ecx
.loop:
  cmp ecx, edx
  jl .endloop
  shl dword ptr [rdi+rcx*2], 16
  dec ecx
  jmp .loop
.endloop:
  mov word ptr [rdi+rdx*2], si
  sub rdi, 16
  inc dword ptr [rdi+12]
.exit:
  ret
