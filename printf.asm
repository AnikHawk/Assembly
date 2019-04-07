section .data
	format db "print this %d", 10, 0


section .text
	global main
	extern printf
main:
	;push rbp
	;mov rbp,rsp
	mov rdi, format
	mov rsi, 100
	mov al, 0
	call printf ;WRT ..plt
	
	mov rax, 60
	xor rdi, rdi
	xor rsi, rsi
	syscall
	
