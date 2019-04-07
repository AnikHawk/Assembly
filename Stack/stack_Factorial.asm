segment .data
	scanfmt db "%d",0
	printfmt db 10,"%d",10,0


segment .bss
	x resq 1
	y resq 1


segment .text
	extern printf
	extern scanf

global main
main:
	push rbp
	mov rbp, rsp


	mov rdi, scanfmt
	mov rsi,x
	mov rax,0
	call scanf
	
	
	push qword[x]
	mov rbx, [x]

	call factorial
	mov rdi, printfmt
	mov rsi, r11
	mov rax,0
	call printf
	call exit

factorial:			;function parameter in rbx
	push rbp
	mov rbp, rsp

	mov rbx, [rbp+16]
	dec rbx
	cmp rbx,0
	je basecase

	push rbx
	call factorial		;factorial(n-1) in r11


	mov rax, [rbp+16]	;n in rbp+16
	imul r11		;n * factorial(n-1) in r11
	mov r11, rax

	
	pop rcx			;leave
	pop rbp
	ret 

basecase:
	mov r11,1
	pop rbp			;leave
	ret

	
exit:
	leave
	ret
