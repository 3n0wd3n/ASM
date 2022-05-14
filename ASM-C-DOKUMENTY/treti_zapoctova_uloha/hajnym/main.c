#include <stdio.h>
#define MAX_CHAR 1024
#define OUT_SIZE 2000
char instring[MAX_CHAR+1];
char outstring[OUT_SIZE];
void cuniq(char* in, char* out);

int main(){
	// Načtení řetězce ze standartního vstupu
	scanf("%1024[^\\0]$", instring);

	// Zavolání funkce a předání argumentů funkci
	cuniq(instring, outstring);

	// Vypsáni řětězce
	printf("%s\n", outstring);
	return 0;
}
