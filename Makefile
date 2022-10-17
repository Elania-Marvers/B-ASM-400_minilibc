all:
	nasm -f elf64 strlen.asm
	nasm -f elf64 strlcpy.asm
	gcc test.c *.o -o program
