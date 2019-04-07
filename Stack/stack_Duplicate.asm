segment .data
	scanfmt db "%d",0
	printfmt db "%d ",0
	newline db 10
	ara dq 10,1,2,2,3,3,4,5,6,7,7,8,9,1,2,3	
	len dq 15
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

	push 0
	call foo

	mov rdi, newline
	mov rax,0
	call printf
	
	leave 
	ret



foo:		
	push rbp
	mov rbp, rsp
	
	mov rax, [rbp+16]	;index to check
	cmp rax,[len]		;final index check
	je done

	
	mov rdx, [ara+rax*8]	;data in index
	dec rax			
	call checkloop		;check array 0...(i-1)

	
	mov rax, [rbp+16]
	inc rax			;check next index
	push rax
	call foo	
	
	pop rcx			;leave
	pop rbp
	ret 

done:
	leave
	ret



checkloop:
	push rbp
	mov rbp, rsp

	cmp rax,0		;no duplicate in (i-1)...0
	jle unique
	
	cmp rdx, [ara+rax*8]	;duplicate found
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
