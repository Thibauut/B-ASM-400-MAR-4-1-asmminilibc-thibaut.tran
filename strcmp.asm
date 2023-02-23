global strcmp
strcmp:
    ;stocke l'argument 1
    mov rax, rdi
    ;stock l'argument 2
    mov rcx, rsi

    ;initialisation des variables
    mov r8, 0
    mov r9, 0
for:
    ;on compare les deux caractères
    mov r8b, [rax]
    mov r9b, [rcx]
    cmp r8b, r9b
    ;si égal on continue
    je next
    ;sinon on retourne la différence
    sub r8b, r9b
    ; movsx permet de convertir un octet en entier signé
    movsx eax, r8b
    ret
next:
    ;incrémente
    inc rax
    inc rcx
    ;si on a atteint la fin de la chaine
    cmp r8b, 0
    je returnEqual
    ;sinon on continue
    jmp for

returnEqual:
    ;si égal retourne 0
    mov eax, 0
    ret
