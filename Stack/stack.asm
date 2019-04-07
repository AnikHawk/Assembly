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
	

	mov rdi, scanfmt
	mov rsi, y
	mov rax,0
	call scanf
	
	push qword[x]
	push qword[y]

	call foo
	call exit

foo:
	push rbp
	mov rbp, rsp

	mov rbx, [rbp+16]
	mov rax, [rbp+24]
	add rbx, rax

	mov rdi, printfmt
	mov rsi, rbx
	mov rax,0
	call printf
	leave
	ret 


	
exit:
	leave
	ret
