section .data
    num1 dd '2'
    mensagem1 db "Digite um numero (1 digito)", 0xa
    len1 equ $ - mensagem1
    mensagem2 db "O menor número é: ", 0xa
    len2 equ $ - mensagem2
    mensagem3 db "Os dois números são iguais!", 0xa
    len3 equ $ - mensagem3

segment .bss
    menor_num resb 1
    num resb 1

section .text
global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensagem1
    mov edx, len1
    int 0x80

    jmp pegar_num
    

pegar_num:
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 1
    int 0x80

    mov eax, [num1]
    mov ebx, [num]

    cmp eax, ebx

    je iguais
    jb primeiro_menor
    jg segundo_menor

iguais:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensagem3
    mov edx, len3
    int 0x80
    jmp end

primeiro_menor:
    mov [menor_num], eax
    jmp print

segundo_menor:
    mov [menor_num], ebx
    jmp print

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensagem2
    mov edx, len2
    int 0x80
    jmp print2

print2:
    mov eax, 4
    mov ebx, 1
    mov ecx, menor_num
    mov edx, 1
    int 0x80
    jmp end

end:
    mov eax, 1
    xor ebx, ebx
    int 0x80