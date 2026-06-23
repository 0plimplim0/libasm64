.intel_syntax noprefix

.global str_split
str_split:
  # WARNING: Memory overflow risk!! Need refactor
  # str_split(rdi = dest_addr | rsi = str_addr | rdx = char(default=0x20))
  # Prologue
  push rbp
  mov rbp, rsp
  
  mov ax, 0x20
  test dl, dl
  cmovz dx, ax
  
  xor ecx, ecx      # Iterator
  xor r8d, r8d      # Temp1
  xor r9d, r9d      # dest_ptr
  xor r10d, r10d    # Temp2
  mov [rdi+r9], rsi
  add r9d, 8
.loop:
  mov r10b, byte ptr [rsi+rcx]
  test r10b, r10b
  jz .epilogue
  cmp r10b, dl
  je .equal
  inc rcx
  jmp .loop
.equal:
  lea r8, [rsi+rcx+1]
  mov [rdi+r9], r8
  add r9d, 8
  mov byte ptr [rsi+rcx], 0x0
  inc rcx
  jmp .loop

.epilogue:
  mov rsp, rbp
  pop rbp
  ret
