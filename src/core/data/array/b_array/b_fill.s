.intel_syntax noprefix
.global b_array_fill
b_array_fill:
  # b_array_fill(rdi = arr_addri | rsi = val)
  xor eax, eax
  sub rdi, 16
  cmp dword ptr [rdi], 0x59525241
  mov rcx, -1
  cmovnz rax, rcx
  jnz .exit
  mov edx, dword ptr [rdi+8]
  mov dword ptr [rdi+12], edx
  xor ecx, ecx
  add rdi, 16
.loop:
  cmp ecx, edx
  jae .exit
  mov byte ptr [rdi+rcx], sil
  inc ecx
  jmp .loop
.exit:
  ret
