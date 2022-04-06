test: test_asm.o
	ld -o test test_asm.o

test_asm.o: test_asm.asm
	nasm -f elf64 test_asm.asm

