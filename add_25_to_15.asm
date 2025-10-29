;nasm -f elf32 add_25_to_15.asm -o add_25_to_15.o
;ld -m elf_i386 add_25_to_15.o -o add_25_to_15
;./add_25_to_15

section .data
    msg db "Sum from 25 down to 15 = ", 0
    newline db 10, 0

section .bss
    sum resd 1
    buffer resb 16

section .text
    global _start

_start:
    mov ecx, 25         ; start counter = 25
    mov eax, 0          ; initialize sum = 0

loop_dec:
    add eax, ecx        ; sum += ecx
    dec ecx             ; ecx--
    cmp ecx, 14         ; stop when ecx == 14
    jne loop_dec

    mov [sum], eax      ; store result

   
    mov eax, [sum]
    mov edi, buffer + 15
    mov byte [edi], 0   ; null terminator

convert_loop:
    dec edi
    xor edx, edx
    mov ebx, 10
    div ebx             ; eax / 10
    add dl, '0'         ; convert remainder to ASCII
    mov [edi], dl
    test eax, eax
    jnz convert_loop

   
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg
    mov edx, 27         ; message length
    int 0x80

   
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer + 15
    sub edx, edi        ; string length = end - start
    int 0x80

    
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

   
    mov eax, 1
    xor ebx, ebx
    int 0x80
