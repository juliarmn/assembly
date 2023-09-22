section .data
    welcome db 0dh, oah, odh, 0ah, "*********** Bem-vindo *************", odh
    welcome_length equ $- welcome

    prompt1 db "Digite o primeiro número: ", 0xA, 0xD
    prompt1_length equ $- prompt1

    prompt2 db "Digite o segundo número: ", 0xA, 0xD
    prompt2_length equ $- prompt2

    op db "(1)Add, (2)Sub, (3)Mult, (4)Div", 0xA, 0xD
    op_length equ $- op

    op db "Digite a opcao: ", 0xA, 0xD

section .bss
    num1 resb 1
    num2 resb 1
    opcao resb 2
    resp resb 2

section .text
    global _start
    extern printFunction
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, prompt1_length
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int  0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, prompt2_length
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, op
    mov edx, op_length
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, opcao
    mov edx, 4
    int 0x80

    mov ah, [opcao]
    sub ah, '0' ; transformao ASCII em número

    cmp ah, 1
    JE somar_valores
    cmp ah, 2
    JE subtrair_valores
    cmp 
    