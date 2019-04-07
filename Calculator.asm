SECTION .data
	init db "0: Exit", 10, "1: A + B", 10, "2: A - B", 10, "3: A * B", 10, "4: A / B", 10, 0
	decisionprompt db "Enter your decision: ",0
	decisionerror db "Error: Invalid Request",10,0
	numAprompt db "Enter A: ", 0
	numBprompt db "Enter B: ", 0
	sumtext db "A + B = %d",10,0
	subtext db "A - B = %d", 10, 0
	multext db "A * B = %d", 10, 0
	divtext db "A / B = %d , A % B = %d", 10, 0
	scanformat: db "%d"

SECTION .bss
buf: resb 4096
numA resb 4
numB resb 4
decision resb 4

SECTION .text
	extern printf
	extern scanf

GLOBAL main
main:


	;print init
	mov rdi, init
	mov al,0
	call printf


decide:
	;ask for decision
	mov rdi, decisionprompt
	mov al, 0
	call printf


	;input decision
	mov rdi, scanformat
	mov rsi, decision
	mov al,0
	call scanf

	;check invalid decision or exit decision
	cmp dword[decision], 4
	jg error ;jump if greater than 4
	cmp dword[decision], 0
	je exit ;jmp if equal 0
	jl error ;jmp if less than 0



inputAB:
	;prints Enter number A: 
	mov rdi, numAprompt
	mov al, 0 ; number of arguments in SSE
	call printf

	
	;scans first value in numA
	mov rdi, scanformat
	mov rsi, numA 
	mov al, 0 ; number of arguments in SSE
	call scanf



	mov rdi, numBprompt
	mov al, 0 ; number of arguments in SSE
	call printf



	mov rdi, scanformat
	mov rsi, numB 
	mov al, 0 ; number of arguments in SSE
	call scanf

	
jmpcalculate:
	;jump to block according to decision
	mov rdx, [decision]
	cmp rdx, 1
	je sum
	cmp rdx, 2
	je sub
	cmp rdx, 3
	je mult
	cmp rdx, 4
	je divd
	jmp error



error:
	mov rdi, decisionerror
	mov al,0
	call printf
	jmp decide

	


sum:
	;sum and print
	mov rdi, sumtext
	mov rsi, [numA]
	add rsi, [numB]
	mov al,0
	call printf
	jmp decide	


sub:
	;subtract and print
	mov rdi, subtext
	mov rsi, [numA]
	sub rsi, [numB]
	mov al,0
	call printf	
	jmp decide


mult:
	;multiply (rax = rax * op)
	mov rax, [numA]
	mul dword [numB]

	;print
	mov rdi, multext
	mov rsi, rax
	mov al,0
	call printf	
	jmp decide


divd:
	;divide (rax = rax/op || rdx = rax%op)
	xor rdx, rdx ;clear rdx
	mov rax, [numA]
	div dword [numB]

	;print result
	mov rdi, divtext
	mov rsi, rax
	mov al,0
	call printf	
	jmp decide

	

exit:
	ret




