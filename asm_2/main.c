#include <stdio.h>
int demo(int n);
int absolut_value(int a);
int sgn(int i);
char max2c(char a, char b);
unsigned min3us(unsigned short a, unsigned short b, unsigned short c);

int main(int n){
        printf("Answer to life %i \n", demo(2));
        printf("Absolut value %i \n", absolut_value(-7));
        int number = -4;
        printf("Signum of number %i is %i \n", number, sgn(number));
        char number_a = 9;
        char number_b = 6;
        printf("Maximal number from number a = %i and b = %i is number %i \n", number_a, number_b, max2c(number_a, number_b));
        unsigned short first_num = 9;
        unsigned short second_num = 6;
        unsigned short third_num = 1;
        printf("Whis is small number from f_num = %i and s_num = %i and t_num = %i is %i \n", first_num, second_num, third_num, min3us(first_num, second_num, third_num));
        return 0;
}
