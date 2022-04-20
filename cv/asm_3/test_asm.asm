global _start

SYS_EXIT equ 60

section .text
_start:
	mov rax, SYS_EXIT
	mov rdi, 42
	syscall

