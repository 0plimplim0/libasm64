.intel_syntax noprefix

.global io_purge
io_purge:
  # io_purge(rdi = IO_STREAM)
  # Prologue
  push rbp
  mov rbp, rsp

  mov qword ptr [rdi+12], 0
  #Epilogue
  mov rsp, rbp
  pop rbp
  ret
