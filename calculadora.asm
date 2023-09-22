section .data
    prompt1 db "Digite o primeiro número: ", 0
    prompt2 db "Digite o segundo número: ", 0
    op db "Escolha a operação: ", 0
    add_op "1. Adição", 0
    sub_op "2. Subtração", 0
    mult_op "3. Multiplicação", 0
    div_op "4. Divisão", 0

section .bss
    num1 resq 1
    num2 resq 1
    opcao resb 2

section .text
    global _start
    extern printf
    extern scanf
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, add_op
    