section .data
    sum dd 0

section .text
    global _start

_start:
    mov ecx, 15      ; counter starts at 15
    mov eax, 0       ; initialize sum = 0

loop_add:
    add eax, ecx     ; sum += ecx
    inc ecx          ; ecx = ecx + 1
    cmp ecx, 26      ; stop when ecx = 26
    jne loop_add

    ; store result in memory
    mov [sum], eax

    ; exit the program
    mov eax, 1       ; sys_exit
    xor ebx, ebx
    int 0x80
