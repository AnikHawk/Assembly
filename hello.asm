section .data

message:
db 'hello, world!', 10, 0

section .text

global _start
_start:
mov rax, 1 ; syscall write() opcode
mov rdi, 1 ; fd 1 (stdout)
mov rsi, message
mov rdx, 14 ; message size
syscall

mov rax, 3Ch ; syscall exit() opcode
xor rdi, rdi ; exit status 0
syscall
