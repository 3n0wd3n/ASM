#include <stdio.h>

/*
SPOUŠTĚNÍ souboru

$ gcc main.c -o main
$ echo "Ahoj ze standartního vstupu" | ./main

kdybych měl soubor text.txt a v něm nějaky text tak by to vypadalo takto

$ cat text.txt | ./main

*/

int main()
{
    char line[BUFSIZ];
    fgets(line, sizeof(line), stdin);
    printf("stdin: %s", line);
}