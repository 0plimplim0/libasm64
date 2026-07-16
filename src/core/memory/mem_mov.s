.intel_syntax noprefix

# TODO: refactor this bc is not optimal
.global mem_mov
mem_mov:
  # mem_mov(rdi = src_addr | rsi = dest_addr | rdx = n_bytes)
  # Prologue
  push r13
  push rbp
  mov rbp, rsp

  mov r13, rsi
  sub rsp, rdx
  mov rsi, rsp
  call mem_cpy
  mov rdi, rsp
  mov rsi, r13
  call mem_cpy
    
    # Epilogue
  mov rsp, rbp
  pop rbp
  pop r13
  ret
