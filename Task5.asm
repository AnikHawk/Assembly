SECTION .data
	scanfmt db "%d",0
	spc db " ",0
	star db "*",0
	printfmt db "%d ",0
	newline db 10,0


SECTION .bss
	n resq 1

SECTION .txt 
	extern printf
	extern scanf
global main

main:
	mov rdi, scanfmt
	mov rsi, n
	mov al,0
	call scanf

	xor rcx,rcx
	mov rcx, [n]
	mov r10, 1
	

l1:

	push r10
	mov r11, r10
   spcloop:
	
	push r11

	mov rdi, spc
	;mov rsi, r11
	mov rax,0
	call printf

	pop r11
	inc r11
	cmp r11, [n]
	jl spcloop

	pop r10
	mov r12, 1
	mov rcx, r10
	imul rcx,2
	sub rcx, 1
	push r10

   innerloop:
	push r12
	push rcx

	mov rdi, star
	mov rax,0
	call printf

	pop rcx
	pop r12
	inc r12
	cmp r12, rcx
	jle innerloop

	
out:
	pop r10
	
	mov rdi, newline
	mov rax, 0
	push r10
	call printf
	pop r10

	add r10,1
	cmp r10, [n]
	jge exit
	jmp l1
	

	

exit:
	ret
