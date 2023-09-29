section .data
    mensagem1 db "Digite alguma coisa: ", 0
    mensagem2 db "Você digitou: ", 0

section .bss ;variáveis ainda não definidas na memória
    entrada resb 255 ; espaço de buffer reservado na memória

section .text
    global _start
    _start:

    mov EAX, 4
    mov EBX, 1
    mov ECX, mensagem1
    mov EDX, 21
    int 0x80 ; analisa o estado do processador e manda pro kernel

    mov EAX, 3
    mov EBX, 0
    mov ECX, entrada
    mov EDX, 255
    int 0x80
    
    mov EAX, 4
    mov EBX, 1
    mov ECX, mensagem2
    mov EDX, 14
    int 0x80

    mov EAX, 4
    mov EBX, 1
    mov ECX, entrada
    mov EDX, 255
    int 0x80

    mov eax, 1
    int  0x80

