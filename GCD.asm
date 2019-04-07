SECTION .data
	scanfmt db "%d",0
	printfmt db "GCD of %d and %d is %d",10,10,0
	prompt1 db "Enter first number: ",0
	prompt2 db "Enter second number: ",0

SECTION .bss
	num1 resb 8
	num2 resb 8

SECTION .text
	extern printf
	extern scanf
global main
main:

scan1:
	mov rdi, prompt1
	mov rax, 0
	call printf

	mov rdi, scanfmt
	mov rsi, num1
	mov al,0
	call scanf

scan2:
	mov rdi, prompt2
	mov rax, 0
	call printf

	mov rdi, scanfmt
	mov rsi, num2
	mov al,0
	call scanf

;move to registers
	mov rax, [num1]
	mov rbx, [num2]
	
loop:
	cmp rax, rbx
	jz printGCD
	jg n1minusn2
	jl n2minusn1


n1minusn2:
	sub rax, rbx
	jmp loop


n2minusn1:
	sub rbx, rax
	jmp loop


printGCD:
	mov rdi, printfmt
	mov rsi, [num1]
	mov rdx,[num2]
	mov rcx, rax
	mov al,0
	call printf
	jmp exit

exit:
	ret



