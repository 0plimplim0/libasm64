.intel_syntax noprefix

.global io_exit
io_exit:
  # io_exit(rdi = exit_code)

  mov eax, 60
  syscall
