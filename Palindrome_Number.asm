SECTION .data
	scanfmt db "%d",0
	printfmt db "Reverse: %d",10,0
	number db "Number: ",0
	yes db "Palindrome",10,0
	no db "Not Palindrome",10,0

SECTION .bss
 	x resb 8

SECTION	.txt
	extern printf
	extern scanf
global main

main:

scan:
	mov rdi, number
	mov rax,0
	call printf

	mov rdi, scanfmt
	mov rsi, x
	mov al,0
	call scanf

	mov rax, [x]
	mov r10, 10
	mov rbx, 0	;reverse in rbx

loop:
	mov rdx,0
	div r10
	push rax	;n = n/10
	mov rax, rbx	;
	push rdx	;mul changes rdx to 0
	mul r10		;rev*10
	pop rdx		;restore rdx (rem)
	add rax, rdx	;rev*10 + rem in rax
	mov rbx, rax	;rev = rev*10 + rem
	pop rax
	cmp rax, 0
	jne loop
	je printRev




printRev:
	mov rdi, printfmt
	mov rsi, rbx
	mov al,0
	call printf
	;jmp exit


checkPal:
	cmp rbx, [x]
	je printYes
	jne printNo

printYes:
	mov rdi, yes
	mov rax, 0
	call printf
	jmp exit

printNo:
	mov rdi, no
	mov rax,0
	call printf
	jmp exit




exit:
	ret		
	
