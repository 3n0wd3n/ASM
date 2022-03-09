global obsah_obdelnika
global obvod_ctverce
global obsah_ctverce
global obvod_trojuhelnika
global obvod_trojuhelnika2
global obsah_trojuhelnika2
global obsah_trojuhelnika3
global objem_krzchle


section .text
obsah_obdelnika:
        mov eax, edi    ;move first side to eax
        imul eax, esi   ;multiply first side by second side
        ret

obvod_ctverce:
        mov eax, edi    ;move side to eax
        add eax, eax    ;multiply by 2
        add eax, eax    ;multiply by 2
        ret

obsah_ctverce:
        mov eax, edi    ;move side to eax
        imul eax, eax   ;side squared
        ret

obvod_trojuhelnika:
        mov eax, edi    ;move first side to eax
        add eax, esi    ;add second side
        add eax, edx    ;add third side
        ret

obvod_trojuhelnika2:
        mov eax, edi    ;triangle side to eax
        mul eax, 3      ;multiply by 3
        ret

obsah_trojuhelnika2:
        mov eax, edi    ;first side of triangle to eax
        imul eax, esi   ;times second side of triangle
        div 2           ;divided by 2
        ret