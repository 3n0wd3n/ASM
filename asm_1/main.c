#include <stdio.h>

int demo(int n);
int circuit_of_square(int n);
int content_of_square(int a);
int sum(int n, int m);
int absi(int l);
int content_of_rectangle(int ab, int bc);
int circuit_of_triangle(int d, int e, int f);
int equilateral_triangle(int rt);
// int right_triangle(int hanger_a, int hanger_b);
int cube_volume(int cube_edge);
unsigned int arithmetic_mean(int number_1, int number_2, int number_3);

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

        int d = 1;
        int e = 2;
        int f = 3;
        printf("Circuit of triangle with edges a = %i, b = %i and c = %i is %i \n", d, e, f, circuit_of_triangle(d, e, f));

        int rt = 4;
        printf("Circuit of equilateral triangle with edge equals to %i is %i \n", rt, equilateral_triangle(rt));

        int hanger_a = 3;
        int hanger_b = 4;
        // printf("Content of right triangle with hanger one equals to %i and hanger two equals to %i is %i \n", hanger_a, hanger_b, right_triangle(hanger_a, hanger_b));

        int cube_edge = 5;
        printf("Volume of cube with edge equals to %i is %i \n", cube_edge, cube_volume(cube_edge));

        unsigned int number_1 = 4;
        unsigned int number_2 = 3;
        unsigned int number_3 = 5;
        printf("Arithmetic mean of numbers %i, %i, %i is %i", number_1, number_2, number_3, arithmetic_mean(number_1, number_2, number_3));
        return 0;
}