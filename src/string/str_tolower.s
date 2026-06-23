.intel_syntax noprefix

.global str_tolower
str_tolower:
  # str_tolower(rdi = str_addr)
  # Prologue
  push rbp
  mov rbp, rsp

  xor eax, eax      # Container(?)
  xor ecx, ecx      # Iterator
.loop:
  mov al, byte ptr [rdi+rcx]
  test al, al
  jz .epilogue
  cmp al, 0x41
  jb .nl
  cmp al, 0x5A
  ja .nl
  or al, 0x20
  mov byte ptr [rdi+rcx], al
.nl:
  inc ecx
  jmp .loop
  
.epilogue:
  mov rsp, rbp
  pop rbp
  ret
