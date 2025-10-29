section .data
    sum dd 0

section .text
    global _start

_start:
    mov ecx, 25      ; counter starts at 25
    mov eax, 0       ; initialize sum = 0

loop_dec:
    add eax, ecx     ; sum += ecx
    dec ecx          ; ecx = ecx - 1
    cmp ecx, 14      ; stop when ecx = 14
    jne loop_dec

    mov [sum], eax

    mov eax, 1       ; sys_exit
    xor ebx, ebx
    int 0x80
