.intel_syntax noprefix

.global str_toupper
str_toupper:
  # str_toupper(rdi = str_addr)
  # Prologue
  push rbp
  mov rbp, rsp

  xor eax, eax      # Container(?)
  xor ecx, ecx      # Iterator
.loop:
  mov al, byte ptr [rdi+rcx]
  test al, al
  jz .epilogue
  cmp al, 0x61
  jb .nl
  cmp al, 0x7A
  ja .nl
  and al, 0xDF
  mov byte ptr [rdi+rcx], al
.nl:
  inc ecx
  jmp .loop
  
.epilogue:
  mov rsp, rbp
  pop rbp
  ret
