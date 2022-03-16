main: main.o assembly.o
	gcc -o main main.o assembly.o
	
main.o: main.c
	gcc -c main.c
	
assembly.o: assembly.asm 
	nasm -f elf64 assembly.asm 	
