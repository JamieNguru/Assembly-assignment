; nasm -f elf64 factorial.asm -o factorial.o
; gcc main.c factorial.o -o factorial
; ./factorial

section .text
    global factorial        ; make it visible to C

; long factorial(long n)
factorial:
    mov rax, 1              ; result = 1
    mov rcx, rdi            ; get n (1st argument in rdi)

    cmp rcx, 1
    jbe .done               ; if n <= 1, return 1

.fact_loop:
    imul rax, rcx           ; rax *= rcx
    dec rcx
    cmp rcx, 1
    jge .fact_loop

.done:
    ret

