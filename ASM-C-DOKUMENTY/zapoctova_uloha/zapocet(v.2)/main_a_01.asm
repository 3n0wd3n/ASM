;definovani globalnich funkci
global str_to_int
global print_str
global triangle

;deklarace konstant
SYS_WRITE	equ 1
SYS_EXIT	equ 60
STDOUT	equ 1
; BUFFER_SIZE	equ 5000		

;#########PRVNI ULOHA##########

str_to_int:
	mov rax, 0					; registr ktery vracim s prevedenym cislem
	mov r8, 0					; registr pro urceni delky retezce - 2 kvuli mocninam 
	mov r9, 0					; registr pro pomocne scitani cisel jako mezivypocet
	mov r10, 0					; registr pro uchovani delky retezce mezi cykly
	mov r11b, 0					; registr pro uchovani puvodni hodnoty registeru al
	mov rcx, 0					; countr pro pomoc s posuvem 
	mov rdx, 1					; registr pro dočasne uchovani mocniny
	jmp length_of_string		; skaceme na navesti, ktere nam pomuze zjistit delku retezce

char_loop:
	mov r8, r10		; r8 = 2
	sub r8, rcx		; r8 - rcx --> 2 - 0, 2 - 1 = 1
	mov rdx, 1		; rdx = 1 vzdy musim nastavit registr pro uchovani mocniny na jedna aby v kazdem cyklu power_loop zacinal jednickou
	cmp r8, 0
	je power_loop_special	; mocnina pro cislo 10 ^ 0
	jmp power_loop
	multiplication_of_number:
		mov al, byte [rdi + rcx] 	 
		add rcx, 1		; rcx + 1 = 1
		mov r11b, al			; r11b = al	musim si zapamatovat puvodni hodnotu al predtim nez budu posouvat o -48 jinak bych nikdy z cyklu nevyskocil protoze al by se nerovnalo nikdy nule
		sub al, 48				; prevadim string na int 
		imul rax, rdx			; 1 * 100 = 100, 2 * 10 = 20, 3 uvadim cislo na spravny rad
		add r9, rax		; r9 + 100 --> r9 = 100 v prvním
		cmp r11b, 0				; mozna chyba
		jne char_loop
		mov rax, r9
		ret

power_loop:						; cyklus, ktery nam pomaha udelat mocninu
	imul rdx, rsi	; rdx * rsi --> 1 * 10 = 10, 10 * 10 = 100, 
	sub r8, 1		; r8 - 1 --> 2 - 1 = 1, 1 - 1 = 0
	cmp r8, 0					
	jne power_loop
	jmp multiplication_of_number

power_loop_special:
	jmp multiplication_of_number

length_of_string:
	mov al, byte [rdi + rcx] 
	add rcx, 1
	add r8, 1
	cmp al, 0
	jne length_of_string
	mov rcx, 0
	sub r8, 2	; r8 = 2
	; mov rax, r8 -> test jestli je delka retezce takova jaka chci
	mov r10, r8		; r10 = 2
	jmp char_loop

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

;#########CTVRTA ULOHA##########

; _start:
; 	mov rax, SYS_READ			; nacteme data ze standartniho vstupu (konzole)
; 	mov rdi, STDIN
; 	mov rsi, input_to_buff
; 	mov rdx, BUFFER_SIZE
; 	syscall
; 	mov rdi, rsi				; vloží hodnotu bufferu na prvni argument funkce
; 	mov rsi, 10					; určíme jaky základ bude mit číslo, ktere prevadime ze str na int
; 	call str_to_int
; 	mov rsi, rax				; vložíme druhy argument 
; 	call triangle				; zavolame funkci trojuhelni
; 	call print_str				; zavolame funkci tisknuti retezce
; 	mov rax, SYS_EXIT			; ukonceni programu
; 	mov rdi, 42					; nahrajeme do rdi 
; 	syscall

; section .bss
; input_to_buff:
; 	resb BUFFER_SIZE