#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// unsigned int str_to_int(char *s, unsigned int base);
void print_str(char *s);
void triangle(char *buf, unsigned int size);

int main(){
    // prevod textove reprezentace na celociselnou hodnotu
    /*
    str_to_int("123", 10);
    str_to_int("1001", 10);
    str_to_int("123", 2);
    str_to_int("FE", 16);
    */

    // vypis retezce
    print_str("Hi OS1!");
    printf("\n\n");

    // vytvoreni trojuhelniku
    /*
    triangle(buf, 7);
    */

    // {"*", "**", "*.*", "*..*", "*...*", "*....*", "*******"}

    char *buf = malloc(255);
    triangle(buf, 3);
    printf("%s", buf);
    printf("\n");

    return 0;
}


