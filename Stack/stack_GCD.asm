segment .data
	scanfmt db "%d",0
	printfmt db 10,"%d",10,0


segment .bss
	big resq 1
	small resq 1


segment .text
	extern printf
	extern scanf

global main
main:
	push rbp
	mov rbp, rsp


	mov rdi, scanfmt
	mov rsi,big
	mov rax,0
	call scanf
	

	mov rdi, scanfmt
	mov rsi, small
	mov rax,0
	call scanf
	
	mov rax,[big]
	mov rbx,[small]
	cmp rax, rbx
	jge okay
	mov [small],rax
	mov [big], rbx


okay:	
	push qword[big]
	push qword[small]

	call gcd

	mov rdi, printfmt
	mov rsi, r11
	mov rax,0
	call printf

	call exit

gcd:
	push rbp
	mov rbp, rsp

	mov rbx,[rbp+16]	;small in rbx
	mov rax,[rbp+24]	;big in rax
	cmp rbx, 0
	je basecase

	
	mov rdx,0
	idiv rbx		
	push rbx		;small in rbx
	push rdx		;remainder in rdx
	call gcd
	

	leave
	ret 

basecase:
	mov r11, rax		;result in r11
	leave
	ret
	
exit:
	leave
	ret
