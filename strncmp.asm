global strncmp

strncmp:
    ;stocke l'argument 1
    mov rdi, rdi
    ;stock l'argument 2
    mov rsi, rsi
    ;stock l'argument 3
    mov rdx, rdx

    cmp rdx, 0
    je returnEqual

    ;initialisation des variables
    mov r8, 0
    mov r9, 0

for:
    ;on compare les deux caractères
    mov r8b, [rdi]
    mov r9b, [rsi]
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
    inc rdi
    inc rsi
    ;décrémente
    dec rdx
    ;si on a atteint la taille entrée
    cmp rdx, 0
    je returnEqual
    ;si on a atteint la fin de la chaine
    cmp r8b, 0
    je returnEqual
    ;sinon on continue
    jmp for

returnEqual:
    ;si égal retourne 0
    mov eax, 0
    ret
