global cuniq

cuniq:
	; rdi = input 
	; rsi = output
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov [rbp-8], rdi ; [rbp-8] input (adresa aktualního řádku inputu)
	mov [rbp-16], rsi ; [rbp-16] output (adresa aktualního řádku outputu)
	; použivám [rbp-24] jako adresu další řádky
	; používám [rbp-32] jako počítadlo aktuání řádky
	cmp rdi, 0
	je cuniq_done
cuniq_loop:
	mov qword [rbp-32], 1 ; count = 1
	mov rdi, [rbp-8]
	cmp rdi, 0
	je cuniq_done
	call nextstr ; zkontrolujeme další
	mov [rbp-24], rax
	cmp rax, 0
	je cuniq_loop_update
cuniq_loop_cmp:
	mov rdi, [rbp-8]
	mov rsi, rax
	call strcmp
	cmp rax, 0
	jne cuniq_loop_update
	inc qword [rbp-32] ; count ++
	mov rdi, [rbp-24]
	call nextstr
	mov [rbp-24], rax
	cmp rax, 0
	jne cuniq_loop_cmp
cuniq_loop_update:
	; zkontrolujeme, zda je řetězec nulový
	mov rax, [rbp-8]
	cmp byte [rax], 0
	je cuniq_done
	; write '\t'
	mov rsi, [rbp-16]
	mov byte [rsi], 9 ; '\t' = 9
	inc rsi
	; napišeme počet
	mov rdi, [rbp-32]
	call dec2str
	; napíšeme aktuální řádku
	mov rdi, [rbp-16]
	call findNULL
	mov rdi, rax
	; přidáme mezeru
	mov word [rdi], 32 ; 32 ascii code for sapce
	inc rdi
	mov rsi, [rbp-8]
	call strcpy
	mov [rbp-16], rax
	mov rax, [rbp-24]
	mov [rbp-8], rax
	jmp cuniq_loop
cuniq_done:
	; na konec přidáváme nový řádek :)
	mov rdi, [rbp-16]
	call findNULL
	mov word [rax], 10
	leave
	ret
	; kopírujeme str2 do str1, dokud '\n' nebo '\0'
	; vrátíme adresu '\0'
	; rdi = str1
	; rsi = str2
strcpy:
	mov rax, rdi
strcpy_loop:
	mov dl, [rsi]
	cmp dl, 0
	je strcpy_done
	cmp dl, 10
	je strcpy_loop_done
	mov [rax], dl
	inc rax
	inc rsi
	jmp strcpy_loop
strcpy_loop_done:
	mov [rax], dl ; uložíme nový řádek a poté ukončíme smyčku
	inc rax
strcpy_done:
	mov byte [rax], 0
	ret
	; porovnáváme 2 řetězce až do '\n' nebo '\0'
	; pokud se rovná, vrátíme 0, jinak žádné nulové číslo
	; rdi = str1
	; rsi = str2
strcmp:
	xor rax, rax ; rax = 0
strcmp_loop:
	mov al, [rdi]
	mov dl, [rsi]
	cmp al, 0
	je strcmp_checkdl
	cmp al, 10
	je strcmp_checkdl
	cmp dl, 0
	je strcmp_done
	cmp dl, 10
	je strcmp_done
	sub al, dl
	jne strcmp_done
	inc rdi
	inc rsi
	jmp strcmp_loop
strcmp_done:
	ret
strcmp_checkdl:
	cmp dl, 0
	je strcmp_0
	cmp dl, 10
	je strcmp_0
	mov rax, 1 ; not equals string
	ret
strcmp_0:
	xor rax, rax
	ret
	; tato funkce vrátí adresu dalšího řetězce 
	; pokud žádný další řetězec nevrátí 0
	; rdi = adresa řetězce
nextstr:
	mov rax, rdi
	cmp rax, 0
	je nextstr_end
nextstr_loop:
	cmp byte [rax], 0
	je nextstr_0
	cmp byte [rax], 10
	je nextstr_done
	inc rax
	jmp nextstr_loop
nextstr_done:
	inc rax
	cmp byte [rax], 0
	je nextstr_0
	ret
nextstr_0:
	xor rax, rax ; return 0
nextstr_end:
	ret 
	; tato funkce převede desetinnou hodnotu na řetězec
	; rdi = hodnota desetinného čísla, které chceme převést
	; rsi = stringbuffer, který bude přijímat řetězec
dec2str:
	mov rax, rdi
	mov r8, 10
	xor rcx, rcx ; rcx = 0 jenom countr
dec2str_loop1:
	xor rdx, rdx ; rdx = 0
	div r8 ; rax = kvocient ; rdx = zbytek
	add rdx, '0' ; převedod do ascii :)
	push rdx
	inc rcx
	cmp rax, 0
	jne dec2str_loop1
dec2str_loop2:
	pop rdx
	mov [rsi], dl
	inc rsi
	loop dec2str_loop2
	mov byte [rsi], 0 ; připneme null na konec
	ret
	; ; tato funkce vrátí adresu prvního bajtu NULL '\0'
	; rdi = adresa řetězce
	; rax = adresa NULL char 
findNULL:
	mov rax, rdi
findNULL_loop:
	cmp byte [rax], 0
	je findNULL_done
	inc rax
	jmp findNULL_loop
findNULL_done:
	ret
