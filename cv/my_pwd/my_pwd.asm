global _start

SYS_GETCWD equ 79
SYS_READ equ 0
BUFFER_SIZE equ 64
STDOUT equ 1

section .text
_start:
	mov rax, SYS_GETCWD
	mov rdi, input_buffer
	mov rsi, BUFFER_SIZE
	syscall

	mov rdi, rax
	mov rax, SYS_READ

	syscall



section .bss
input_buffer:
	resb BUFFER_SIZE
