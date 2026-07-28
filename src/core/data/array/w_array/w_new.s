.intel_syntax noprefix

.global w_array_new
w_array_new:
  # w_array_new(rdi = size | rsi = addr(optional))
  # header = (0-3 = magic_n(0x59525241) | 4 = ownwership | 5-7 = padding | 8-11 = size | 12-15 = n_elements)
  # Prologue
  push r12
  push rbp
  mov rbp, rsp
  mov r12d, edi     # size
  test rsi, rsi
  jnz .nmem
  shl rdi, 1
  cmp rdi, 0xFFFFFFFFFFFFFFEF
  mov ecx, -4
  ja .err
  add rdi, 16
  call mem_alloc
  test rax, rax
  mov ecx, -2
  jz .err
  mov rsi, rax      # addr
  mov byte ptr [rsi+4], 1     # ownership
  jmp .continue
.nmem:
  mov byte ptr [rsi+4], 0
.continue:
  mov dword ptr [rsi], 0x59525241     # 'ARRY'
  mov dword ptr [rsi+8], r12d   # size   
  mov dword ptr [rsi+12], 0     # n_elements
  lea rax, [rsi+16]
  jmp .epilogue
.err:
  mov dword ptr [_errno+rip], ecx
  xor eax, eax
.epilogue:
  mov rsp, rbp
  pop rbp
  pop r12
  ret
