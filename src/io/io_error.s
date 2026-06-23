.intel_syntax noprefix

.global io_error
io_error:
  # io_error(rdi = str_addr | rsi = str_len | rdx = err_num)
  # if err_num == 0 : print; ret; else : print; exit;
  # Prologue
  push r13
  push r14
  push rbp
  mov rbp, rsp
  
  mov r14, rdx
  mov r13, rdi
  test rsi, rsi
  jnz .nz
  call str_len
  mov rsi, rax
.nz:
  mov eax, 1
  mov edi, 2
  mov rdx, rsi
  mov rsi, r13
  syscall
  test r14, r14
  jz .epilogue
  mov edi, r14d
  call io_exit
.epilogue:
  mov rsp, rbp
  pop rbp
  pop r14
  pop r13
  ret
