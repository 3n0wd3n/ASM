global demo
global circuit_of_square
global content_of_square
global sum
global absi
global content_of_rectangle
global circuit_of_triangle
global equilateral_triangle
; global right_triangle
global cube_volume
global arithmetic_mean

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

circuit_of_triangle:
	mov eax, edx
	mov ebx, edi
	mov ecx, esi
	add eax, ebx
	add eax, ecx
	ret

equilateral_triangle:
	mov eax, edi
	imul eax, 3
	ret

; zeptat se proč to nejde 
; right_triangle:
; 	mov eax, edi
; 	mov ebx, esi
; 	mov ecx, 2
; 	imul eax, ebx
; 	div ecx
; 	ret

cube_volume:
	mov eax, edi
	mov ebx, eax
	imul eax, eax
	imul eax, ebx
	ret

; zeptat se učitele proč to nejde
arithmetic_mean:
	mov eax, edx
	mov ebx, edi
	mov ecx, esi
	add eax, ebx
	add eax, ecx
	div 3
	ret




