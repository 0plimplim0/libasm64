.intel_syntax noprefix

.global sys_exit
sys_exit:
  # sys_exit(rdi = exit_code)

  mov eax, 60
  syscall
