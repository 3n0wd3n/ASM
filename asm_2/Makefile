main: main.o demo.o
	gcc -o main main.o demo.o

main.o: main.c
	gcc -c main.c

demo.o: demo.asm
	nasm -f elf64 demo.asm
