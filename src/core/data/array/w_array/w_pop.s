.intel_syntax noprefix
.global w_array_pop
w_array_pop:
  # w_array_pop(rdi = arr_addr)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  mov edx, dword ptr [rdi+12]
  test edx, edx
  mov rcx, -3
  cmovz rax, rcx
  jz .exit
  dec dword ptr [rdi+12]
  dec edx
  add rdi, 16
  mov ax, word ptr [rdi+rdx*2]
.exit:
  ret
