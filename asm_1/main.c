#include <stdio.h>

int demo(int n);
int circuit_of_square(int n);
int content_of_square(int a);
int sum(int n, int m);
int absi(int l);
int content_of_rectangle(int ab, int bc);
int main(int n)
{
        printf("Answer to life %i \n", demo(2));

        int edge = 3;
        printf("Circuit of square with edge equals to %i is %i \n", edge, circuit_of_square(edge));
        printf("Content of square with edge equals to %i is %i \n", edge, content_of_square(edge));

        int a = -2;
        int b = 3;
        printf("Sum of %i and %i is  %i \n", a, b, sum(a, b));

        int abs_n = -7;
        printf("Abs value of number %i is %i \n", abs_n, absi(abs_n));

        int ab = 3;
        int bc = 6;
        printf("Content of rectangle with one edge equals to %i and second one equals to %i is %i \n", ab, bc, content_of_rectangle(ab, bc));

        int a = 1;
        int b = 2;
        int c = 3;

        return 0;
}