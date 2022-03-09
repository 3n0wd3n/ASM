global demo
global absolut_value
global sgn
global max2c
global min3us

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
        mov eax, edi
        mov ebx, esi
        mov ecx, r8d
        ret
