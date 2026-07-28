.intel_syntax noprefix
.global q_array_insert
q_array_insert:
  # q_array_insert(rdi = arr_addr | rsi = val(1byte) | rdx = pos)
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
  mov r9, qword ptr [rdi+rcx*8]
  mov qword ptr [rdi+8+rcx*8], r9
  dec ecx
  jmp .loop
.endloop:
  mov qword ptr [rdi+rdx*8], rsi
  sub rdi, 16
  inc dword ptr [rdi+12]
.exit:
  ret
