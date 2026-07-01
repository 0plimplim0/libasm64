.intel_syntax noprefix

.global io_seek
io_seek:
  # io_seek(rdi = IO_STREAM | rsi = n_bytes | rdx = pos(default=CUR))
