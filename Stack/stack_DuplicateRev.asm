segment .data
	scanfmt db "%d",0
	printfmt db "%d ",0
	newline db 10
	ara dq 10,1,2,2,3,3,4,5,6,7,7,8,9,1,2,3	
	len db 15
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

	push qword[len]	
	call foo

	mov rdi, newline
	mov rax,0
	call printf
	
	leave 
	ret



foo:		
	push rbp
	mov rbp, rsp
	
	mov rax, [rbp+16]
	cmp rax,0
	jle done

	
	mov rdx, [ara+rax*8]
	dec rax
	call checkloop

	
	mov rax, [rbp+16]
	dec rax
	push rax
	call foo	
	
	pop rcx			;leave
	pop rbp
	ret 

done:
	mov rdi, printfmt
	mov rsi, [ara]
	mov rax,0
	call printf
	leave
	ret



checkloop:
	push rbp
	mov rbp, rsp
	cmp rax,0
	jle unique
	
	cmp rdx, [ara+rax*8]
	je dup
	dec rax
	call checkloop
	leave 
	ret


unique:

	mov rdi, printfmt
	mov rsi, rdx
	mov rax,0
	call printf
	leave 
	ret
	

dup:
	leave
	ret

exit:
	leave
	ret
