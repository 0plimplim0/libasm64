.intel_syntax noprefix
.section .bss
.global _errno
.align 4
_errno:
  .space 4

.section .text
.global _start
_start:
  mov rdi, [rsp]
  lea rsi, [rsp+8]
  call main
  mov rdi, rax
  call sys_exit

.global errno
errno:
  xor eax, eax
  xchg dword ptr [_errno+rip], eax
  ret

