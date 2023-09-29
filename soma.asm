section .data
    mensagem1 db "Digite o primeiro numero (1 digito)", 0
    mensagem2 db "Digite o segundo (1 digito)", 0
    res db "A soma e: "
    mensagem1_len equ $ - mensagem1
    mensagem2_len equ $ - mensagem2
    res_len equ $ - res

segment .bss
    num1 resb 1
    num2 resb 1
    sum resb 2

section .text
    global _start
    _start:
        mov EAX, 4
        mov EBX, 1
        mov ECX, mensagem1
        mov EDX, mensagem1_len
        int 0x80

        mov EAX, 3
        mov EBX, 0
        mov ECX, num1
        mov EDX, 1
        int 0x80

        mov EAX, 4
        mov EBX, 1
        mov ECX, mensagem2
        mov EDX, mensagem2_len
        int 0x80

        mov EAX, 3
        mov EBX, 0
        mov ECX, num2
        mov EDX, 1
        int 0x80

        mov EAX, [num1]
        sub EAX, '0'
        mov EBX, [num2]
        sub EBX, '0'
        add EAX, EBX
        add EAX, '0' ; Indica que o resultado é um inteiro

        mov [sum], eax

        mov EAX, 4
        mov EBX, 1
        mov ECX, res
        mov EDX, res_len
        int 0x80

        mov EAX, 4
        mov EBX, 1
        mov ECX, sum
        mov EDX, 2
        int 0x80

        ; Saída limpa do programa
        mov eax, 1
        xor EBX, EBX
        xor ECX, ECX
        xor EDX, EDX
        int 0x80
