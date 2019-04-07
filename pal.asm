section .data
        string db "AbBa"
        length equ $ - string

        msg1 db 10,"Palindrome",10,10,0
        msg2 db 10,"Not Palindrome",10,10,0

section .text
        global main
        extern printf

main:
        mov ebx, string                   ; start of word                                 
        mov eax, (string + length - 1)    ; end of word                                   

        mov ecx, (length / 2)             ; check will run for half of the word           
check:
        mov dl, [ebx]                     ; compare first and last letters                
        xor dl, [eax]
	cmp dl, 0
	je success
case:
	cmp dl, 32
        jne failure
success:
        inc ebx
        dec eax
        loop check                                                            
        mov rdi, msg1
        mov al,0
        call printf
        jmp done

failure:
        mov rdi, msg2
        mov al,0
	call printf
        add esp,4

done:
        ret


