global swap
global iteration

section .text
swap:
	mov ecx, [rsi]
	mov edx, [rdi]
	mov [rsi], edx
	mov [rdi], ecx
	ret

iteration:
	MOV eax, 1
iteration_loop:
	cmp eax, 6
	je iteration_done
	add eax, 1
	jmp iteration_loop

iteration_done:
	ret





