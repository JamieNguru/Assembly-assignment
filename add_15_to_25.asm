;nasm -f elf32 add_15_to_25.asm -o add_15_to_25.o
; ld -m elf_i386 add_15_to_25.o -o add_15_to_25
; ./add_15_to_25

section .data
    msg db "Sum from 15 to 25 = ", 0
    newline db 10, 0

section .bss
    sum resd 1
    buffer resb 16         ; buffer for converted number

section .text
    global _start

_start:
    mov ecx, 15            ; start counter = 15
    mov eax, 0             ; initialize sum = 0

sum_loop:
    add eax, ecx           ; sum += ecx
    inc ecx                ; ecx++
    cmp ecx, 26            ; stop when ecx = 26
    jne sum_loop

    mov [sum], eax         ; store result

    ; 🧮 Convert sum (in EAX) to string in buffer
    mov eax, [sum]         ; number to convert
    mov edi, buffer + 15
    mov byte [edi], 0      ; null terminator

convert_loop:
    dec edi
    xor edx, edx
    mov ebx, 10
    div ebx                ; divide eax by 10 → quotient in eax, remainder in edx
    add dl, '0'            ; convert remainder to ASCII
    mov [edi], dl
    test eax, eax
    jnz convert_loop       ; repeat until eax == 0

    ; 🖨️ Print message
    mov eax, 4             ; sys_write
    mov ebx, 1             ; file descriptor (stdout)
    mov ecx, msg
    mov edx, 20            ; length of message
    int 0x80

    ; 🖨️ Print number
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer + 15
    sub edx, edi           ; calculate string length properly
    int 0x80

    ; 🖨️ Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; ✅ Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
