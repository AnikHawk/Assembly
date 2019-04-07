SECTION .data
	num1prompt db "Enter number 1: ", 0
	num2prompt db "Enter number 2: ", 0
	sumtext db "Summation is %d",10,0
	subtext db "Subtraction gives %d", 10, 0
	scanformat: db "%d"

SECTION .bss
buf: resb 4096
num1 resb 4
num2 resb 4

SECTION .text
	extern printf
	extern scanf

GLOBAL main
main:

	;prints Enter number 1: 
	mov rdi, num1prompt
	mov al, 0 ; number of arguments in SSE
	call printf

	
	;scans first value in num1
	mov rdi, scanformat
	mov rsi, num1 
	mov al, 0 ; number of arguments in SSE
	call scanf



	mov rdi, num2prompt
	mov al, 0 ; number of arguments in SSE
	call printf



	mov rdi, scanformat
	mov rsi, num2 
	mov al, 0 ; number of arguments in SSE
	call scanf


	;sum and print
	mov rdi, sumtext
	mov rsi, [num1]
	add rsi, [num2]
	mov al,0
	call printf	

	

	ret




