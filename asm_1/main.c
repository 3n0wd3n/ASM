#include <stdio.h>

int demo(int n);
int circuit_of_square(int n);
int content_of_square(int a, int b);
int sum(int n, int m);
int absi(int l);

int main(int n){
        printf("Answer to life %i \n", demo(2));
        printf("Circuit of square is %i \n", circuit_of_square(3));
        printf("Content of square is %i \n", content_of_square(3, 5));
        printf("Sum is %i \n", sum(2, 2));
        printf("Abs value %i \n", absi(-7));
        return 0;
}