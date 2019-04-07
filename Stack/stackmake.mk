all:
	nasm -f elf64 -o stack.o stack_Duplicate.asm
	gcc -no-pie -o stack stack.o
	./stack
