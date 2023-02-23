global strcasecmp
strcasecmp:
    mov rax, rdi
    mov rcx, rsi

    mov r8, 0
    mov r9, 0
lowcase1:
    ;convertie en minuscule le caractère de la première chaine
    mov r8b, [rax] ;on récupère le caractère
    cmp r8b, 'A'
    jl lowcase2 ;si c'est inférieur à 'A' on passe au caractère de la deuxième chaine
    cmp r8b, 'Z'
    jg lowcase2 ;si c'est supérieur à 'Z' on passe au caractère de la deuxième chaine
    add r8b, 32 ;sinon on convertie en minuscule

lowcase2:
    ;convertie en minuscule
    mov r9b, [rcx] ;on récupère le caractère
    cmp r9b, 'A'
    jl compare ;si c'est inférieur à 'A' on passe a la comparaison
    cmp r9b, 'Z'
    jg compare ;si c'est supérieur à 'Z' on passe a la comparaison
    add r9b, 32 ;sinon on convertie en minuscule

compare:
    ;compare les caractères
    cmp r8b, r9b
    ;si c'est égal on passe au caractère suivant
    je next
    ;sinon on retourne la différence
    sub r8b, r9b
    movsx eax, r8b
    ret
next:
;increment
    inc rax
    inc rcx
    ;si on est arrivé à la fin de la chaine
    cmp r8b, 0
    je returnEqual
    ;sinon on continue
    jmp lowcase1

returnEqual:
    ;si on est arrivé à la fin des deux chaines
    mov eax, 0
    ret

