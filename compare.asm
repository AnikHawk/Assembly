SECTION .data
	prompt1fmt db "Enter number 1: ",0
	prompt2fmt db "Enter number 2: ",0
	scanfmt db "%d",0
	greaterfmt db "%d is Greater",10,10,0
	equalfmt db "Numbers are equal", 10,10,0


SECTION .bss
	num1 resb 8
	num2 resb 8


SECTION .text
	extern printf
	extern scanf

global main
main:

scan1:

	mov rdi, prompt1fmt
	mov al,0
	call printf
	
	mov rdi, scanfmt
	mov rsi, num1
	mov al,0
	call scanf

scan2:

	mov rdi, prompt2fmt
	mov al,0
	call printf

	mov rdi, scanfmt
	mov rsi, num2
	mov al,0
	call scanf

compare12:
	mov rbx, [num1]
	mov rdx, [num2]
	cmp rbx,rdx
	jl print2
	jg print1
	je printequal


print1:
	mov rdi, greaterfmt
	mov rsi, rbx
	mov al,0
	call printf
	jmp exit

print2:
	mov rdi, greaterfmt
	mov rsi, rdx
	mov al, 0
	call printf
	jmp exit

printequal:
	mov rdi, equalfmt
	mov al,0
	call printf
	jmp exit








exit:
	ret
