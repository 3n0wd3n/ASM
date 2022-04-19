;definovani globalnich funkci
global print_str
global triangle

;deklarace konstant
SYS_WRITE	equ 1
SYS_EXIT	equ 60
STDOUT	equ 1

print_str:
	mov rcx, 0					; nastavime hodnotu counteru na nulu --> oddelene kvuli tomu, abychom si nevynulovavaly counter

point_str_loop:
	mov al, byte [rdi + rcx]	; do registru al si nahrajeme aktualni char cyklu 
	add rcx, 1					; inkrementujeme promennou counter
	cmp al, 0					; porovname jestli nahodou nejsme na konci retezce
	je print_str_done 			; jestli jsme, tak muzeme jit tisknout
	jmp point_str_loop			; jestli ne, tak se vracime zpatky na navesti 

print_str_done:
	mov rax, SYS_WRITE			; vypsani retezce v registru rax 
	mov rsi, rdi				; registr do ktereho ulozime adresu retezce
	mov rdi, STDOUT
	mov rdx, rcx				; delka retezce (pocet charu bez \0)
	syscall
	ret

;note for me (dot in ASCII is 46 | star in ASCII is 42 | new line in ASCII is 10)

triangle:
	mov rcx, 0					; nastavime hodnotu counteru na nulu
	mov rbx, rsi				; velikost těch odvěsen
								; mozne lazeni vstupu
	cmp rbx, 0
	je undefined				; kdyz je velikost odvesen rovna nule
	cmp rbx, 1
	je top						; kdyz je velikost odvesen rovna jedne
	cmp rbx, 2
	je small_triangle			; kdyz je velikost odvesen rovna dvema
	jmp signpost				; pokracujeme na rozcestnik kdyz je velikost odvesen jina nez zminene 

undefined:
	mov byte [rdi + rcx], 85	; U
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 78	; N
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 68	; D
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 69	; E
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 70	; F
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 73	; I
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 78	; N
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 69	; E
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 68	; T
	ret

top:
	mov byte [rdi + rcx], 42
	ret

small_triangle:
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 10
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 42
	ret

signpost:
	mov r10, 0					; sloupec R8
	mov r11, 0					; radek R9
	jmp first_floor				; tisk prvniho patra

after_first_floor:
	sub rsi, 2					; odectu prvni a posledni radek RSI
	mov byte [rdi + rcx], 42	; prvni hvezda v rade
	add rcx, 1					; zvisim hodnotu counteru

row:
	mov byte [rdi + rcx], 46
	add rcx, 1					; zvisim hodnotu counteru
	add r11, 1
	cmp r10, r11
	jne row
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 10
	add rcx, 1					; zvisim hodnotu counteru
	add r10, 1
	mov r11, 0
	cmp r10, rsi
	jne after_first_floor
	add rsi, 2
	mov r10, r9

last_row:
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	sub r10, 1
	cmp r10, 0
	jne last_row
	ret
	
first_floor:
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 10
	add rcx, 1					; zvisim hodnotu counteru
	jmp after_first_floor
	





