#include <stdio.h>

int swap(int *, int *);
int iteration(int iter);

int main(int argc, char **argv)
{
	int a = 42;
	int b = 24;
	int *p1 = &a;
	int *p2 = &b;
	swap(p1, p2);
	printf("%i %i", *p1, *p2);
	
	
	printf("Iteration to %i \n", iteration(5));
	
	
	return 0;
}

