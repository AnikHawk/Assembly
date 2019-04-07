segment .data
	scanfmt db "%d",0
	printfmt db "index: %d",10,10,0
	notfound db "Not Found",10,10,0
	newline db 10
	ara dq 10,11,12,13,14,15,16,17,18,19,20,21,22
	len dq 13
	two dq 2
segment .bss
	x resq 1
	y resq 1
	start resq 1
	end resq 1


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
	
	mov rcx, [len]
	dec rcx

	push 0
	push rcx
	
	call binarySearch
	call exit

binarySearch:			
	push rbp
	mov rbp, rsp
	
	mov r12,[rbp+16]	;end
	mov r11, [rbp+24]	;start

	cmp r11,r12		;basecase
	jg notFound
	
	mov rdx,0
	mov rax,r12
	add rax,r11		
	idiv qword[two]
	mov rbx, rax		;rbx holds (start+end)/2
 				
	mov r8, [ara+rbx*8]
	cmp [x],r8
	je found
	jg higher

lower:	
	push r11
	dec rbx
	push rbx
	jmp recall
	
higher:
	inc rbx
	push rbx
	push r12
recall:
	call binarySearch

	leave
	ret 

found:
	mov rdi, printfmt
	mov rsi, rbx
	mov rax,0
	call printf
	pop rbp			;leave
	ret

notFound:
	mov rdi, notfound
	mov rax,0
	call printf
	leave 
	ret
	
exit:
	leave
	ret
