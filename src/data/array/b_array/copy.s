.intel_syntax noprefix
.global b_array_copy
b_array_copy:
  # b_array_copy(rdi = arr_src | rsi = arr_dest)
  sub rdi, 16
  sub rsi, 16
  mov rcx, -1
  cmp dword ptr [rdi], 0x59525241
  cmovnz rax, rcx
  jnz .exit
  cmp dword ptr [rsi], 0x59525241
  cmovnz rax, rcx
  jnz .exit
  mov edx, dword ptr [rdi+12]
  cmp edx, dword ptr [rsi+8]
  mov rcx, -3
  cmova rax, rcx
  ja .exit
  mov dword ptr [rsi+12], edx
  add rdi, 16
  add rsi, 16
  xor ecx, ecx
.loop:
  cmp ecx, edx
  jae .endl
  mov al, byte ptr [rdi+rcx]
  mov byte ptr [rsi+rcx], al
  inc ecx
  jmp .loop
.endl:
  xor eax, eax
.exit:
  ret
