global main
extern printf, scanf

section .data
   msg db "Enter a number:",10,0
   format db "%d",0

section .bss
   number resb 4

section .text
main:
   mov rdi, msg
   mov al, 0
   call printf

   mov rdi, format
   mov rsi, number
   mov al, 0
   call scanf

   ret
