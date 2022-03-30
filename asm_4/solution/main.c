#include <stdio.h>
void printi(int n){
        printf("%i\n", n);
}

void my_putchar(int c)
{
        printf("%c", c);
}

void show_number();
void countdown(int);
void print_row(int n, char c);
void print_rect(int rows, int cols);


int main(int argc, char **argv)
{
        print_rect(3, 5);
        return 0;
}
