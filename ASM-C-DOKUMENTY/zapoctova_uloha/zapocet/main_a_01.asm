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
	mov rbx, rsi				; velikost těch odvěsen (druhy parametr funkce, rdi by byl prvni parametr což je buff)
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

first_floor:
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 10
	add rcx, 1					; zvisim hodnotu counteru
	jmp after_first_floor

after_first_floor:
	sub rbx, 2					; odectu prvni a posledni radek RSI respektive rbx
	mov byte [rdi + rcx], 42	; prvni hvezda v rade
	add rcx, 1					; zvisim hodnotu counteru

row:
	mov byte [rdi + rcx], 46	; pridam tecku
	add rcx, 1					; zvisim hodnotu counteru
	add r11, 1					; zvisim hodnotu radku
	cmp r10, r11				; porovnani sloupce a radku
	jne row						; jestli se sloupce nerovna radku, tak pokracujeme v cyklu
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 10	; odradkujeme
	add rcx, 1					; zvisim hodnotu counteru
	add r10, 1					; pokracujeme dalsim radkem
	mov r11, 0					; vynulujeme radek
	cmp r10, rbx				; porovname jestli se sloupec rovna patrum
	jne after_first_floor		
	add rbx, 2					; pro plny posledni radek musime velikost odvesen vratin na puvodni hodnotu
	mov r10, rbx

last_row:
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	sub r10, 1
	cmp r10, 0
	jne last_row
	ret
	
	





