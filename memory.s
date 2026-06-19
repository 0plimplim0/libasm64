.intel_syntax noprefix

.global memset
memset:
  # memset(rdi = src_addr | rsi = n_bytes | rdx = byte)
  # Prologue
  push rbp
  mov rbp, rsp
  
  # Setup
  xor ecx, ecx      # Iterator
  mov rax, 0x0101010101010101
  imul rax, rdx     # RAX = Container(?)
  mov r8, rsi      # Temp

.memset_loop:
  cmp rcx, rsi
  jae .memset_epilogue
  cmp r8, 8
  jb .memset_n64b
  mov [rdi+rcx], rax
  add rcx, 8
  sub r8, 8
  jmp .memset_loop
.memset_n64b:
  mov byte ptr [rdi+rcx], al
  inc rcx
  jmp .memset_loop

.memset_epilogue:
  mov rax, rcx
  mov rsp, rbp
  pop rbp
  ret

.global memcpy
memcpy:
  # memcpy(rdi = src_addr | rsi = dest_addr | rdx = n_bytes)
  # Prologue
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # Iterator
  mov r8, rdx       # Temp
.memcpy_loop:
  cmp rcx, rdx
  jae .memcpy_epilogue
  cmp r8, 8
  jb .memcpy_n64b
  mov rax, [rdi+rcx]
  mov [rsi+rcx], rax
  add rcx, 8
  sub r8, 8
  jmp .memcpy_loop
.memcpy_n64b:
  mov al, byte ptr [rdi+rcx]
  mov byte ptr [rsi+rcx], al
  inc rcx
  jmp .memcpy_loop

.memcpy_epilogue:
  mov rsp, rbp
  pop rbp
  ret

# TODO: refactor this bc is not optimal
.global memmov
memmov:
  # memmov(rdi = src_addr | rsi = dest_addr | rdx = n_bytes)
  # Prologue
  push r13
  push rbp
  mov rbp, rsp

  mov r13, rsi
  sub rsp, rdx
  mov rsi, rsp
  call memcpy
  mov rdi, rsp
  mov rsi, r13
  call memcpy

.memmov_epilogue:
  mov rsp, rbp
  pop rbp
  pop r13
  ret

.global memcmp
memcmp:
  # memcmp(rdi = addr1 | rsi = addr2 | rdx = addr_len)
  # Prologue
  push rbp
  mov rbp, rsp

  xor ecx, ecx      # Iterator
  mov r8, rdx       # Temp
  xor eax, eax
  xor r9d, r9d
.memcmp_loop:
  cmp rcx, rdx
  jae .memcmp_epilogue
  cmp r8, 8
  jb .memcmp_n64b
  mov rax, [rdi+rcx]
  sub rax, [rsi+rcx]
  jnz .memcmp_nequal
  add rcx, 8
  sub r8, 8
  jmp .memcmp_loop
.memcmp_n64b:
  mov al, byte ptr [rdi+rcx]
  sub al, byte ptr [rsi+rcx]
  jnz .memcmp_nequal
  inc rcx
  jmp .memcmp_loop

.memcmp_epilogue:
  mov eax, r9d
  mov rsp, rbp
  pop rbp
  ret
.memcmp_nequal:
  mov r9d, -1
  jmp .memcmp_epilogue
