.intel_syntax noprefix

.global io_clear
io_clear:
  # io_clear() NO ARGS
  # Prologue
  push rbp
  mov rbp, rsp

  sub rsp, 8
  mov rax, 0x00485B1B4A325B1B 
  mov [rsp], rax
  mov eax, 1
  mov edi, 1
  mov rsi, rsp
  mov edx, 7
  syscall

  # Epilogue
  mov rsp, rbp
  pop rbp
  ret

.global io_exit
io_exit:
  # io_exit(rdi = exit_code)

  mov eax, 60
  syscall

.global io_print
io_print:
  # io_print(rdi = str_addr | rsi = str_len)
  # Prologue
  push r13
  push rbp
  mov rbp, rsp
  
  mov r13, rdi      # str_addr
  test rsi, rsi
  jnz .io_print_nz
  call strlen
  mov rsi, rax
.io_print_nz:
  mov eax, 1
  mov edi, 1
  mov rdx, rsi
  mov rsi, r13
  syscall

  # Epilogue
  mov rsp, rbp
  pop rbp
  pop r13
  ret

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
  jnz .io_error_nz
  call strlen
  mov rsi, rax
.io_error_nz:
  mov eax, 1
  mov edi, 2
  mov rdx, rsi
  mov rsi, r13
  syscall
  test r14, r14
  jz .io_error_epilogue
  mov edi, r14d
  call io_exit
.io_error_epilogue:
  mov rsp, rbp
  pop rbp
  pop r14
  pop r13
  ret

.global io_read
io_read:
  # io_read(rdi = buff_addr | rsi = buff_len)
  # Prologue
  push rbp
  mov rbp, rsp

  test esi, esi
  jz .io_read_nl
  
  mov rdx, rsi
  mov rsi, rdi
  xor edi, edi
  xor eax, eax
  syscall

  #Epilogue
  mov rsp, rbp
  pop rbp
  ret
.io_read_nl:
  mov edi, -15
  call io_exit
