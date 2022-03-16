global demo
global circuit_of_square
global content_of_square
global sum
global absi
global content_of_rectangle

section .text

demo:
	mov eax, 42
	ret


circuit_of_square:
	mov eax, edi
	add eax, eax
	add eax, eax
	ret


content_of_square:
	mov eax, edi
	imul eax, eax
	ret


sum:
	mov eax, edi
	mov ebx, esi
	add eax, ebx
	ret


absi:
	mov eax, edi
	cmp eax, 0
	jge end
	neg eax

end:
	ret


content_of_rectangle:
	mov eax, edi
	mov ebx, esi
	imul eax, ebx
	ret