SECTION .data
	startfmt db "Start from: ",0
	endfmt db  "End at: ",0
	printfmt db "%d",10,0
	scanfmt db "%d",0

SECTION .bss
	start resb 8
	end resb 8

SECTION .text
	extern scanf
	extern printf
global main

main:

scanStart:
	mov rdi, startfmt
	mov al,0
	call printf
	
	mov rdi, scanfmt
	mov rsi, start
	mov al,0 
	call scanf

	
scanEnd:
	mov rdi, endfmt
	mov al,0
	call printf

	mov rdi, scanfmt
	mov rsi, end
	mov al,0
	call scanf	

	mov rax, [start]

loop:
	mov rdi, printfmt
	mov rsi, rax
	push rax	;store rax value in main
	mov rax,0	;rax for printf function
	call printf
	pop rax		;restore rax in main

	add rax, 1
	cmp rax, [end]
	jg exit
	jmp loop

	

exit:
	ret
