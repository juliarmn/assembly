section .data
    numero1 dd '2'
    numero2 dd '4'
    mensagem1 db "O maior numero eh: ", 0xa
    mensagem2 db "Os dois sao iguais", 0xa
    len1 equ $ - mensagem1
    len2 equ $ - mensagem2

segment .bss
    maior resb 1

section.text
    global _start
    _start:
        mov eax, [numero1]
        mov ebx, [numero2]
        cmp eax, ebx

        je num_iguais
        jg num1_maior
        jb num2_maior

    num1_maior:
        mov [maior], eax
        jmp print
    
    num2_maior:
        mov [maior], ebx
        jmp print
    
    num_iguais:
        mov eax, 4
        mov ebx, 1
        mov ecx, mensagem2
        mov edx, len2
        int 0x80
        jmp end

    print:
        mov eax, 4
        mov ebx, 1
        mov ecx, mensagem1
        mov edx, len1
        int 0x80
        jmp print2

    print2:
        mov eax, 4
        mov ebx, 1
        mov ecx, maior
        mov edx, 1
        int 0x80
        jmp end

    end:
        mov eax, 1
        xor ebx, ebx
        int 0x80