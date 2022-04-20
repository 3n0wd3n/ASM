#include <stdio.h>
void printi(int n){
	printf("%i\n", n);
}

void show_number();

void print_row(int m){
	for (int i = 0; i < m; i++){
		printf("%i", 1);
	}
	printf("\n");
}

void putchar_();

void my_putchar(int c){
	printf("%c", c);
}

void print_row_(int n, char c);

int main(int argc, char **argv){
	//printi(34);
	show_number();
	putchar_();
	print_row_(3, 4);
	return 0;
}


