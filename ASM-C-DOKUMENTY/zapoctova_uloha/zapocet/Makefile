main_01: main_c_01.o main_a_01.o
	gcc -o main_01 main_c_01.o main_a_01.o
	
main_c_01.o: main_c_01.c
	gcc -c main_c_01.c
	
main_a_01.o: main_a_01.asm 
	nasm -f elf64 main_a_01.asm 