.intel_syntax noprefix

.global mem_alloc
mem_alloc:
  # mem_alloc(rdi = n_bytes | rsi = index_addr | rdx = i_flag)
  # Index header: 0-7 = num_blocks | 8-15 = closest_free
  # Index slot: 0-1 = status | 2-3 = position | 4-7 = size | 8-15 = block_addr
  # Block header: 0-7 = index_slot | 8-15 = padding

  # Prologue
  push r12
  push r13
  push rbp
  mov rbp, rsp

  test edx, edx         # If != 0: init;
  jnz .init
  
  mov r12, rdi          # n_bytes
  add r12, 15
  and r12, -16
  add r12, 16           # Header+size
  mov r13, rsi          # index_addr
  # Here goes normal code
  mov rcx, [r13+8]      # Closest
  test ecx, ecx
  jz .new_element
  shl ecx, 4
  lea r8, [r13+rcx]     # Block slot
  cmp r12d, dword ptr [r8+4]
  jbe .fit
  xor ecx, ecx
  mov cx, word ptr [r8+2]     # Counter
  add r8, 16
  mov r9, qword ptr [r13]     # num_blocks
  inc ecx
.loop:
  cmp ecx, r9d
  ja .new_element
  cmp word ptr [r8], 0
  jne .loop_notf
  cmp r12d, dword ptr [r8+4]
  ja .loop_notf
  # Fits
  mov word ptr [r8], 1
  mov rax, qword ptr [r8+8]
  add rax, 16
  jmp .epilogue

.loop_notf:
  add r8, 16
  inc ecx
  jmp .loop

.fit:
  mov word ptr [r8], 1      # Update status
  mov r12, qword ptr [r8+8]      # Save block_addr
  xor ecx, ecx
  mov cx, word ptr [r8+2]     # Counter
  inc ecx
  add r8, 16
  mov r9, qword ptr [r13]     # num_blocks
.fit_loop:
  cmp ecx, r9d
  ja .fit_loop_notf
  cmp word ptr [r8], 0
  je .fit_loop_f
  inc ecx
  add r8, 16
  jmp .fit_loop

.fit_loop_f:
  mov qword ptr [r13+8], rcx
  lea rax, [r12+16]
  jmp .epilogue

.fit_loop_notf:
  mov qword ptr [r13+8], 0
  lea rax, [r12+16]
  jmp .epilogue

.new_element:
  # 0-1 = status | 2-3 = pos | 4-7 = size | 8-15 = block_addr
  mov eax, 12
  xor edi, edi
  syscall
  mov r8, rax     # break
  mov rax, qword ptr [r13]
  inc qword ptr [r13]
  shl rax, 4      # num_blocks * 16
  lea rdi, [r13+16+rax]       # Start of new element
  mov word ptr [rdi], 1       # status
  shr rax, 4
  inc rax
  mov word ptr [rdi+2], ax    # pos
  mov qword ptr [rdi+8], r8   # block_addr
  mov dword ptr [rdi+4], r12d      # size
  mov r13, rdi      # index_slot
  lea rdi, [r8+r12]
  mov eax, 12
  mov r12, r8
  syscall
  mov qword ptr [r12], r13      # index_slot
  lea rax, [r12+16]
  jmp .epilogue

.init:
  mov eax, 12
  xor edi, edi
  syscall
  mov r12, rax      # break_pos
  mov eax, 12
  mov rdi, r12
  add rdi, 1048576  # break+1MB
  syscall
  mov qword ptr [r12], 0      # n_slots
  mov qword ptr [r12+8], 0    # closest_free
  mov rax, r12      # index_addr
  jmp .epilogue

.epilogue:
  mov rsp, rbp
  pop rbp
  pop r13
  pop r12
  ret
