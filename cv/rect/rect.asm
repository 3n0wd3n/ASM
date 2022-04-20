global _start

SYS_WRITE equ 1
SYS_EXIT equ 60
STDOUT equ 1
STR_STARS_LEN equ 20


section .text
_start:
	push rbx			;save rbx
	mov rbx, 5			;number of rows

print_loop:
	push r12			;save r12
	mov r12, STR_STARS_LEN		;number of stars to print

stars_loop:
	mov rax, SYS_WRITE		;system call - write
	mov rdi, STDOUT			;to standard output
	mov rsi, str_star		;symbol of star
	mov rdx, 1			;amount
	syscall				;call

	sub r12, 1			;amount to print -1
	cmp r12, 0			;if amount > 0
	jg stars_loop			;print more


	mov rsi, newline		;newline char to output
	mov rdx, 1
	syscall				;call

	sub rbx, 1			;reduce amount of rows to print
	cmp rbx, 0			;amount > 0
	jg print_loop			;print rows

	pop r12

	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

	pop rbx

section .data
str_star:
	db 42
newline:
	db 10

