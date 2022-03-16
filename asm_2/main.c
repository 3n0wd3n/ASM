#include <stdio.h>

int demo(int n);
int absolut_value(int a);
int sgn(int i);
char max2c(char a, char b);
unsigned min3us(unsigned short a, unsigned short b, unsigned short c);
int kladne(int a, int b, int c);
int mocnina(int n, unsigned int m);

int main()
{
        printf("Answer to life %i \n", demo(2));

        printf("Absolut value %i \n", absolut_value(-7));

        int number = -4;
        printf("Signum of number %i is %i \n", number, sgn(number));

        char number_a = 9;
        char number_b = 6;
        printf("Maximal number from number a = %i and b = %i is number %i \n", number_a, number_b, max2c(number_a, number_b));

        unsigned short first_num = 9;
        unsigned short second_num = 3;
        unsigned short third_num = 1;
        printf("Which s is smallest number from f_num = %i and s_num = %i and t_num = %i is %i \n", first_num, second_num, third_num, min3us(first_num, second_num, third_num));

        printf("If all values are greater than 0 function returns 1 otherwise 0: %i \n", kladne(-2, 3, 1));

        printf("Function that returns n ** m: %i \n", mocnina(3, 4));
        return 0;
}
