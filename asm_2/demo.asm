global demo
global absolut_value
global sgn
global max2c
global min3us
global kladne
global mocnina

section .text

demo:
        mov eax, 42
        ret


absolut_value:
        mov eax, edi
        cmp eax, 0
        jge end
        neg eax

        end:
                ret


sgn:
        mov eax, edi
        cmp eax, -1
        jl less
        cmp eax, 1
        jg greater
        mov eax, 0
        ret

        less:
                mov eax, -1
                ret

        greater:
                mov eax, 1
                ret


max2c:
        mov eax, edi
        mov ebx, esi
        cmp eax, ebx
        jl is_less
        ret

        is_less:
                mov eax, ebx
                ret


min3us:
        mov eax, edx    ;do registru eax načtu první argument funkce
        mov ebx, esi    ;do registru ebx načtu druhý argument funkce
        mov ecx, edi    ;do registru ecx načtu tretí argument funkce
comparison_loop:        
        cmp eax, ebx
        jle less_than
        mov eax, ebx
        jmp comparison_loop
less_than:
        cmp eax, ecx
        jl most_less
        mov eax, ecx
        ret
most_less:
        ret


kladne:
        mov eax, edx   
        mov ebx, esi    
        mov ecx, edi
        cmp eax, 0
        jl zaporne
        cmp ebx, 0
        jl zaporne
        cmp ecx, 0
        jl zaporne
        mov eax, 1
        ret
zaporne:
        mov eax, 0
        ret

mocnina:
        mov eax, edi    ;nahraju si číslo, které budu mocnit
        mov ebx, esi    ;nahraju si číslo, které mi bude určovat kolikrat budu mocnit
        mov edx, eax    ;udělam si kopii čísla, které se bude mocnit a pak ho využiju na násobení
        mov ecx, 1      ;counter
mocnina_loop:
        cmp ecx, ebx
        je end_iteration
        add ecx, 1
        imul eax, edx
        jmp mocnina_loop

end_iteration:
        ret