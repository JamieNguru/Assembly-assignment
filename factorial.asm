section .text
    global factorial   ; make the function visible to C

factorial:
    mov eax, 1         ; result = 1
    mov ecx, [esp + 4] ; get n (first argument passed by C)

    cmp ecx, 1
    jbe done           ; if n <= 1, return 1

fact_loop:
    imul eax, ecx      ; eax *= ecx
    dec ecx
    cmp ecx, 1
    jge fact_loop

done:
    ret
