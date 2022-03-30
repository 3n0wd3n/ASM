global show_number
extern printi

global putchar_
extern print_row

global print_row_
extern my_putchar

section .text

show_number:
	mov edi, 42
	mov al, 0
	call printi
	
	ret

putchar_:
	mov edi, 3
	mov al, 0
	call print_row
	
	ret
	
print_row_:
	mov eax, edi
	mov esi, edx
	mov eax, esi
	ret
	 

