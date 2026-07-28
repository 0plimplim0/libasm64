.intel_syntax noprefix
.global d_array_append
d_array_append:
  # d_array_append(rdi = arr_src | rsi = arr_dest)
  sub rdi, 16
  sub rsi, 16
  mov ecx, -1
  cmp dword ptr [rdi], 0x59525241
  cmovnz rax, rcx
  jnz .exit
  cmp dword ptr [rsi], 0x59525241
  cmovnz rax, rcx
  jnz .exit
  mov edx, dword ptr [rsi+8]
  sub edx, dword ptr [rsi+12]
  cmp edx, dword ptr [rdi+12]
  mov ecx, -3
  cmovb rax, rcx
  jb .exit
  lea rcx, [rsi+12]
  mov edx, dword ptr [rsi+12]
  shl rdx, 2
  lea rsi, [rsi+16+rdx]
  mov edx, dword ptr [rdi+12]
  add dword ptr [rcx], edx
  xor ecx, ecx
  add rdi, 16
.loop:
  cmp ecx, edx
  jae .endloop
  mov eax, dword ptr [rdi+rcx*4]
  mov dword ptr [rsi+rcx*4], eax
  inc ecx
  jmp .loop
.endloop:
  xor eax, eax
.exit:
  ret
