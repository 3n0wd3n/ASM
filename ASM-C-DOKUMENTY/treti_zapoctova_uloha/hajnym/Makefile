
default: main
main: cuniq.o main.o
	gcc -o cuniq main.o cuniq.o
main.o: main.c
	gcc -c main.c
cuniq.o: cuniq.asm
	nasm -f elf64 cuniq.asm
clean:
	rm -f cuniq.o main.o cuniq
