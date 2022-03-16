#include <stdio.h>

int swap(int *, int *);
// int iteration(int iter);
int iteration();

int main(int argc, char **argv)
{
	int a = 42;
	int b = 24;
	int *p1 = &a;
	int *p2 = &b;
	printf("Before swap %i %i \n", *p1, *p2);
	swap(p1, p2);
	printf("After swap %i %i \n", *p1, *p2);

	// printf("Iteration to %i \n", iteration(5));
	printf("Iteration to %i \n", iteration());

	return 0;
}
