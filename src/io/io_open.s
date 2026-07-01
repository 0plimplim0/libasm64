.intel_syntax noprefix

.global io_open
io_open:
  # io_open(rdi = IO_STREAM_addr | rsi = filename_addr | rdx = flags | rcx = buff_addr | r8 = buff_size)
