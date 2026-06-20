.intel_syntax noprefix

.global strcmp
strcmp:
  # strcmp(rdi = str1_addr | rsi = str2_addr | rdx = chars_limit(default=no_limit))
  # Prologue
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # iterator
.strcmp_loop:
  cmp rdx, 0
  je .strcmp_no_limit
  cmp rcx, rdx
  jb .strcmp_no_limit
  xor eax, eax
  jmp .strcmp_epilogue
.strcmp_no_limit:
  cmp byte ptr [rdi+rcx], 0
  je .strcmp_strend
  xor r8, r8
  mov r8b, byte ptr [rsi+rcx]
  cmp byte ptr [rdi+rcx], r8b
  jne .strcmp_end0
  inc ecx
  jmp .strcmp_loop

  # Epilogue
.strcmp_epilogue:
  mov rsp, rbp
  pop rbp
  ret

.strcmp_strend:
  cmp byte ptr [rsi+rcx], 0
  jne .strcmp_end0
  xor eax, eax
  jmp .strcmp_epilogue

.strcmp_end0:
  mov eax, -1
  jmp .strcmp_epilogue

.global strlen
strlen:
  # strlen(rdi = str_addr | rsi = limiter(default=0x0))
  #Prologue
  push rbp
  mov rbp, rsp

  xor eax, eax      # iterator
.strlen_loop:
  cmp byte ptr [rdi+rax], sil
  je .strlen_end
  inc eax
  jmp .strlen_loop
.strlen_end:
  mov rsp, rbp
  pop rbp
  ret

.global findc
findc:
  # findc(rdi = str_addr | rsi = char_obj) | Returns offset
  # Prologue
  push rbp
  mov rbp, rsp
  
  xor eax, eax      # iterator
.findc_loop:
  cmp byte ptr [rdi+rax], sil
  je .findc_epilogue
  inc eax
  jmp .findc_loop

.findc_epilogue:
  mov rsp, rbp
  pop rbp
  ret

.global strrev
strrev:
  # strrev(rdi = str_addr | rsi = str_len)
  # Prologue
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # Ptr1
  xor edx, edx      # Temp1
  xor r8d, r8d      # Temp2
  dec esi        # Ptr2
.strrev_loop:
  cmp ecx, esi
  jae .strrev_epilogue
  mov dl, byte ptr [rdi+rcx]
  mov r8b, byte ptr [rdi+rsi]
  mov byte ptr [rdi+rcx], r8b
  mov byte ptr [rdi+rsi], dl
  inc ecx
  dec esi
  jmp .strrev_loop

.strrev_epilogue:
  mov rsp, rbp
  pop rbp
  ret

.global uatoi
atoi:
  # WARNING: Currently only supports 32-bits nums
  # atoi(rdi = str_addr)
  # Prologue
  push rbx
  push rbp
  mov rbp, rsp

  xor eax, eax      # Sum
  xor ecx, ecx      # Iterator
  mov ebx, 10
  xor esi, esi
.atoi_loop:
  mov sil, byte ptr [rdi+rcx]
  cmp sil, 0x0
  je .atoi_epilogue
  sub sil, 0x30
  mul rbx
  add eax, esi
  inc ecx
  jmp .atoi_loop

.atoi_epilogue:
  mov rsp, rbp
  pop rbp
  pop rbx
  ret

.global uitoa
itoa:
  # WARNING: Currently only supports 16-bit nums
  # itoa(rdi = integer | rsi = buff_addr)
  # Prologue
  push rbx
  push rbp
  mov rbp, rsp
  
  xor ecx, ecx      # Temp 1
  xor edx, edx
  mov eax, edi
  xor edi, edi      # Iterator
  mov bl, 10
.itoa_loop:
  div bl
  mov cl, ah
  add cl, 0x30
  mov byte ptr [rsi+rdi], cl
  inc edi 
  cmp al, 0x0
  je .itoa_epilogue
  movzx ax, al
  jmp .itoa_loop

.itoa_epilogue:
  mov rcx, rdi
  mov rdi, rsi
  mov rsi, rcx
  call strrev
  mov rsp, rbp
  pop rbp
  pop rbx
  ret

.global to_upper
to_upper:
  # to_upper(rdi = str_addr)
  # Prologue
  push rbp
  mov rbp, rsp

  xor eax, eax      # Container(?)
  xor ecx, ecx      # Iterator
.to_upper_loop:
  mov al, byte ptr [rdi+rcx]
  test al, al
  jz .to_upper_epilogue
  cmp al, 0x61
  jb .to_upper_nl
  cmp al, 0x7A
  ja .to_upper_nl
  and al, 0xDF
  mov byte ptr [rdi+rcx], al
.to_upper_nl:
  inc ecx
  jmp .to_upper_loop
  
.to_upper_epilogue:
  mov rsp, rbp
  pop rbp
  ret

.global to_upper_raw
to_upper_raw:
  # to_upper_raw(rdi = str_addr | rsi = str_len)
  # Prologue
  push rbp
  mov rbp, rsp

  xor ecx, ecx      # Iterator
  mov rax, 0xDFDFDFDFDFDFDFDF
  mov r8d, esi      # Temp
.to_upper_raw_loop:
  cmp ecx, esi
  jae .to_upper_raw_epilogue
  cmp r8d, 8
  jb .to_upper_raw_n64b
  and [rdi+rcx], rax
  add ecx, 8
  sub r8d, 8
  jmp .to_upper_raw_loop
.to_upper_raw_n64b:
  and byte ptr [rdi+rcx], al
  inc ecx
  jmp .to_upper_raw_loop

.to_upper_raw_epilogue:
  mov rsp, rbp
  pop rbp
  ret

.global to_lower
to_lower:
  # to_lower(rdi = str_addr)
  # Prologue
  push rbp
  mov rbp, rsp

  xor eax, eax      # Container(?)
  xor ecx, ecx      # Iterator
.to_lower_loop:
  mov al, byte ptr [rdi+rcx]
  test al, al
  jz .to_lower_epilogue
  cmp al, 0x41
  jb .to_lower_nl
  cmp al, 0x5A
  ja .to_lower_nl
  or al, 0x20
  mov byte ptr [rdi+rcx], al
.to_lower_nl:
  inc ecx
  jmp .to_lower_loop
  
.to_lower_epilogue:
  mov rsp, rbp
  pop rbp
  ret


.global to_lower_raw
to_lower_raw:
  # to_lower_raw(rdi = str_addr | rsi = str_len)
  # Prologue
  push rbp
  mov rbp, rsp

  xor ecx, ecx      # Iterator
  mov rax, 0x2020202020202020
  mov r8d, esi      # Temp
.to_lower_raw_loop:
  cmp ecx, esi
  jae .to_lower_raw_epilogue
  cmp r8d, 8
  jb .to_lower_raw_n64b
  or [rdi+rcx], rax
  add ecx, 8
  sub r8d, 8
  jmp .to_lower_raw_loop
.to_lower_raw_n64b:
  or byte ptr [rdi+rcx], al
  inc ecx
  jmp .to_lower_raw_loop

.to_lower_raw_epilogue:
  mov rsp, rbp
  pop rbp
  ret

.global strcat
strcat:
  # strcat(rdi = dest_addr | rsi = str1_addr | rdx = str2_addr)
  # Prologue
  push rbx
  push r12
  push r13
  push r14
  push rbp
  mov rbp, rsp

  mov r12, rdi      # dest_addr
  mov r13, rsi      # str1_addr
  mov r14, rdx      # str2_addr
  mov rdi, rsi
  xor esi, esi
  call strlen
  mov ebx, eax
  mov rsi, r12
  mov rdi, r13
  mov rdx, rax
  call memcpy
  add r12, rbx
  mov rdi, r14
  xor esi, esi
  call strlen
  mov rsi, r12
  mov rdi, r14
  mov edx, eax
  call memcpy

  # Epilogue
  mov rsp, rbp
  pop rbp
  pop r14
  pop r13
  pop r12
  pop rbx
  ret

.global strtrim
strtrim:
  # strtrim(rdi = str_addr | rsi = char)

.global strsplit
strsplit:
  # strsplit(rdi = dest_addr | rsi = str_addr | rdx = limiter(default=0x20))

