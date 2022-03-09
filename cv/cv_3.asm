global sgn
global max2c
global min3us
global kladne
global mocnina


section .text
sgn:
        mov eax, edi
        cmp eax, 0
        jg cmpgreater
        jl cmplesser
        ret
cmpgreater:
        mov eax, 1
        ret
cmplesser:
        mov eax, -1
        ret


max2c:
        cmp di, si
        jl maxsecond
        mov ax, di
        ret
maxsecond:
        mov ax, si
        ret


min3us:
        mov ax, di      ;set a
        cmp ax, si      ;compare a and b
        jb min3usb      ;if a < b jmp
        mov ax, si      ;else set b
min3usb:
        cmp ax, dx      ;compare a|b with c
        jb min3usc      ;if a|b < c jmp
        mov ax, dx      ;else set c
min3usc:
        ret


kladne:
        cmp edi, 1
        jl nekladne
        cmp esi, 1
        jl nekladne
        cmp edx, 1
        jl nekladne
        mov eax, 1
        ret
nekladne:
        mov eax, 0
        ret


mocnina:
        mov eax, 1
mocnina_loop:
        cmp esi, 0
        imul eax, edi
mocnina_konec:
        ret