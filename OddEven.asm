SECTION .data
	promptfmt db "Enter number : ",0
	scanfmt db "%d",0
	evenfmt db "Number is Even",10,0
	oddfmt db "Number is Odd",10,0

SECTION .bss
	num1 resb 8
	num2 resb 8

SECTION .text
	extern printf
	extern scanf

global main
main:

scan:
	mov rdi, promptfmt
	mov al,0
	call printf

	mov rdi, scanfmt
	mov rsi, num1
	mov al,0
	call scanf

check:
	xor rdx, rdx
	mov rax,[num1]
	mov r12,2
	idiv r12
	cmp rdx, 0
	je even
	jmp odd


even:
	mov rdi, evenfmt
	mov al,0
	call printf
	jmp exit

odd:
	mov rdi, oddfmt
	mov al,0
	call printf
	jmp exit



exit:
	ret



