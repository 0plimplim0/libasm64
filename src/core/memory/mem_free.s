.intel_syntax noprefix

.global mem_free
mem_free:
  # mem_free(rdi = block_addr)
  # Prologue
  push rbp
  mov rbp, rsp

  mov rdi, [rdi-16]      # index_slot
  mov word ptr [rdi], 0
  xor r8d, r8d
  mov r8w, word ptr [rdi+2]      # Pos
  shl r8d, 4      # Position X 16
  sub rdi, r8     # Index_addr
  shr r8d, 4
  cmp qword ptr [rdi+8], 0
  je .repl
  cmp r8, qword ptr [rdi+8]
  jb .repl
.epilogue:
  mov rsp, rbp
  pop rbp
  ret
.repl:
  mov qword ptr [rdi+8], r8
  jmp .epilogue
