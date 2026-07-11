.intel_syntax noprefix

.global b_array_new
b_array_new:
  # b_array_new(rdi = size | rsi = addr(optional))
  # header = (0-3 = magic_n(0x59525241) | 4 = ownwership | 5-7 = padding | 8-11 = size | 12-15 = n_elements)
  # Prologue
  push r12
  push rbp
  mov rbp, rsp

  cmp edi, 0xFFFFFFEF
  ja .err
  mov r12d, edi     # size

  test rsi, rsi
  jnz .nmem
  add edi, 16
  call mem_alloc
  test rax, rax
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
  
.epilogue:
  mov rsp, rbp
  pop rbp
  pop r12
  ret

.err:
  mov rax, -1
  jmp .epilogue
