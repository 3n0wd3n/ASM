global show_number
global countdown
global print_row
global print_rect

extern printi
extern my_putchar


section .text
show_number:
        mov edi, 42
        mov al, 0
        call printi
        ret

countdown:
        mov ecx, edi
countdown_loop:
        push rcx

        mov edi, ecx
        mov al, 0
        call printi

        pop rcx

        sub ecx, 1
        cmp ecx, 0
        jg countdown_loop
        ret

print_row:
        push rbx
        push r12
        mov ebx, edi            ;move number of iterations to ebx
        mov r12d, esi           ;move char to print to lower half of r12
print_row_loop:
        mov edi, r12d           ;get char out of r12

        mov al, 0
        call my_putchar         ;print char

        sub ebx, 1
        cmp ebx, 0              ;if remaining iterations are greater than 0
        jg print_row_loop       ;print char

        mov al, 0
        mov edi, 10             ;10 is line feed
        call my_putchar         ;print newline

        pop rbx
        pop r12
        ret

print_rect:
        push rbx
        push r12
        mov ebx, edi            ;rows to rbx
        mov r12d, esi           ;cols to r12
print_rect_loop:
        mov edi, r12d           ;how many chars to print
        mov esi, 42             ;42 is astericks

        mov al, 0
        call print_row

        sub ebx, 1
        cmp ebx, 0
        jg print_rect_loop

        pop rbx
        pop r12
        ret

