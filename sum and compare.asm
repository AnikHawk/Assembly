section .data
    ; Define constants
    num1   equ 10  ;num1   db 10 
    num2   equ 5  ;num2   db 5
    msg    db "Sum is desired",10   ; initialize message


section .text

    global _start
;; entry point
_start:
    mov rax, num1   ; mov al, [num1]
    mov rbx, num2  ; mov bl, [num2]
    add rax, rbx  ; add al, bl
    cmp rax, 15  ; cmp al, 15
    jne .exit  ; go to .exit label if rax and 150 are not equal
    jmp .rightSum  ; go to .rightSum label if rax and 150 are equal


; Print message that sum is correct
.rightSum:
    mov     rax, 1  ;; write syscall
    mov     rdi, 1   ;; file descritor, standard output
    mov     rsi, msg  ;; message address
    mov     rdx, 15  ;; length of message    
    syscall  ;; call write syscall
    jmp .exit  ; exit from program


; exit procedure
.exit: 
    mov    rax, 60  ; exit syscall
    mov    rdi, 0   ; exit code
    syscall  ; call exit syscall
