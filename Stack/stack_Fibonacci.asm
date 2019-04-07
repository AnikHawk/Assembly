segment .data
	scanfmt db "%d",0
	printfmt db "%d ",0
	newline db 10,0


segment .bss
	i resq 1



segment .text
	extern printf
	extern scanf

global main
main:
	push rbp
	mov rbp, rsp


	mov rdi, scanfmt
	mov rsi,i
	mov rax,0
	call scanf
	
	mov rcx,0		;index
	mov r11,0		;fib(n-1)
	mov r12,1		;fib(n-2)
	push rcx
	push r11
	push r12
	call fibonacci
	
	mov rdi, newline
	mov rax,0
	call printf

	call exit

fibonacci:
	push rbp
	mov rbp, rsp
	
	mov r12, [rbp+16]	;fib(n-2)
	mov r11, [rbp+24]	;fib(n-1)
	mov rcx, [rbp+32]	;index

	cmp rcx, [i]
	jge basecase
	
	mov r10,r12		
	add r10,r11		;current fib number
	inc rcx
	
	
	call print
	

	push rcx		
	push r10		;current
	push r11		;prev
		
	call fibonacci	
	
	
	
	
basecase:
	leave
	ret 


print:
	mov rdi, printfmt
	mov rsi, r10
	mov rax,0

	push r10
	push r11
	push r12
	push rcx

	call printf

	pop rcx
	pop r12
	pop r11
	pop r10

	ret

exit:
	leave
	ret
