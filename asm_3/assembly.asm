global swap
global iteration

section .text
swap:
	mov ecx, [rsi]
	mov edx, [rdi]
	mov [rsi], edx
	mov [rdi], ecx
	ret



