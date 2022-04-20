my_pwd: my_pwd.o
	ld -o my_pwd my_pwd.o

my_pwd.o: my_pwd.asm
	nasm -f elf64 my_pwd.asm
