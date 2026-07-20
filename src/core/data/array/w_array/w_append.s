.intel_syntax noprefix
.global w_array_append
w_array_append:
  # w_array_append(rdi = arr_src | rsi = arr_dest)
  sub rdi, 16
  sub rsi, 16
  mov rcx, -1
  cmp dword ptr [rdi], 0x59525241
  cmovnz rax, rcx
  jnz .exit
  cmp dword ptr [rsi], 0x59525241
  cmovnz rax, rcx
  jnz .exit
  mov edx, dword ptr [rsi+8]
  sub edx, dword ptr [rsi+12]
  cmp edx, dword ptr [rdi+12]
  mov rcx, -3
  cmovb rax, rcx
  jb .exit
  lea rcx, [rsi+12]
  mov edx, dword ptr [rsi+12]
  shl rdx, 1
  lea rsi, [rsi+16+rdx]
  mov edx, dword ptr [rdi+12]
  add dword ptr [rcx], edx
  xor ecx, ecx
  add rdi, 16
.loop:
  cmp ecx, edx
  jae .endloop
  mov ax, word ptr [rdi+rcx*2]
  mov word ptr [rsi+rcx*2], ax
  inc ecx
  jmp .loop
.endloop:
  xor eax, eax
.exit:
  ret
