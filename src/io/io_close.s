.intel_syntax noprefix

.global io_close
io_close:
  # io_close(rdi = IO_STREAM)
  # Prologue
  push r12
  push rbp
  mov rbp, rsp

  mov r12, rdi
  call io_flush
  mov rdi, r12
  mov r12, qword ptr [rdi+4]      # buff_addr
  mov edi, dword ptr [rdi]
  mov eax, 3
  syscall
  test eax, eax
  cmovz rax, r12

  # Epilogue
  mov rsp, rbp
  pop rbp
  pop r12
  ret
