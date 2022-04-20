;definovani globalnich funkci
global str_to_int
global print_str
global triangle

;deklarace konstant
SYS_WRITE	equ 1
SYS_EXIT	equ 60
STDOUT	equ 1

;#########PRVNI ULOHA##########

str_to_int:
	mov rax, 0					; registr ktery vracim s prevedenym cislem
	mov rbx, 0					; counter pro urceni delky retezce
	mov rcx, 0					; countr pro pomoc s posuvem 
	mov rdx, 10					; registr pro dočasne uchovani mocniny
	jmp length_of_string

print_char_loop:
	mov al, byte [rdi + rcx] 
	add rcx, 1
	cmp al, 0
	jmp convert_to_ascii
	je print_char_loop

convert_to_ascii:
	sub rax, 48
	jmp power

power:
	

length_of_string:
	mov al, byte [rdi + rcx] 
	add rcx, 1
	add, rbx
	cmp al, 0
	je length_of_string

;#########DRUHA ULOHA##########

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

;#########TRETI ULOHA##########

;note for me (dot in ASCII is 46 | star in ASCII is 42 | new line in ASCII is 10)

triangle:
	mov rcx, 0					; nastavime hodnotu counteru na nulu
	; mov rbx, rsi				; velikost těch odvěsen (druhy parametr funkce, rdi by byl prvni parametr což je buff)
								; mozne lazeni vstupu
	cmp rsi, 0
	je undefined				; kdyz je velikost odvesen rovna nule
	cmp rsi, 1
	je top						; kdyz je velikost odvesen rovna jedne
	cmp rsi, 2
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
	mov r10, 0					; sloupec 
	mov r11, 0					; radek 
	jmp first_floor				; preskocime na tisk prvniho patra (je to tu asi zbytecne, ale pro jistotu)

first_floor:
	mov byte [rdi + rcx], 42	; vytisknu hvezdu
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 10	; odradkujeme
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 42	; vytisknu hvezdu
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 42	; odradkujeme
	add rcx, 1	
	mov byte [rdi + rcx], 10	; vytisknu hvezdu
	add rcx, 1					; zvisim hodnotu counteru
	sub rsi, 3					; odectu prvni a posledni radek RSI respektive rbx
	jmp after_first_floor		; preskocime na tisk zbytku (zase je to mozna zbytecne instrukce jmp ale pro jistotu)

after_first_floor:
	mov byte [rdi + rcx], 42	; prvni hvezda v rade
	add rcx, 1					; zvisim hodnotu counteru
	add r10, 1					; zvisim hodnotu radku

row_loop:
	mov byte [rdi + rcx], 46	; pridam tecku
	add rcx, 1					; zvisim hodnotu counteru
	add r11, 1					; zvisim hodnotu radku
	cmp r10, r11				; porovnani sloupce a radku
	jne row_loop				; jestli se sloupce nerovna radku, tak pokracujeme v cyklu
	mov byte [rdi + rcx], 42	; pridam hvezdicku
	add rcx, 1					; zvisim hodnotu counteru
	mov byte [rdi + rcx], 10	; odradkujeme
	add rcx, 1					; zvisim hodnotu counteru
	mov r11, 0					; vynulujeme radek
	cmp r10, rsi				; porovname jestli se sloupec rovna patrum
	jne after_first_floor		
	add rsi, 3					; pro plny posledni radek musime velikost odvesen vratin na puvodni hodnotu
	mov r10, rsi				; do registru r10 nahraju puvodni delku odvesen

last_row:
	mov byte [rdi + rcx], 42
	add rcx, 1					; zvisim hodnotu counteru
	sub r10, 1					; odectu od velikosti odvesen jedna
	cmp r10, 0					; porovnam odvesnu s nulou jestli už nejsem na konci cyklu
	jne last_row
	ret