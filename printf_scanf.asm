SECTION .data
	yourname: db "Your name: ", 0
	welcome: db "Welcome "
	end: db "!", 10, 0
	scanstring: db "%s"


SECTION .bss
buf: resb 4096

;BITS 64
SECTION .text
	extern printf
	extern scanf

GLOBAL main
main:
	mov rdi, yourname
	mov al, 0 ; number of arguments in SSE
	call printf

	mov rax, [welcome]
	mov [buf], rax

	mov rdi, scanstring
	lea rsi, [buf+8]
	mov al, 0 ; number of arguments in SSE
	call scanf

	mov rdi, buf
	mov al, 0 ; number of arguments in SSE
	call printf

	mov rdi, end
	mov al, 0 ; number of arguments in SSE
	call printf

	ret




