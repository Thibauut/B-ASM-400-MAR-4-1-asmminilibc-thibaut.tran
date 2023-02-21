global strrchr
strrchr:
    ;initialisation de rax à 0
    mov rax, rdx
    ;sauvegarde de la premiere adresse de la chaine
    mov rbx, rdi
    ;initialisation de rcx au pointeur de la chaine
    mov rcx, rdi
for:
    ;comparaison de l'octet courant avec le caractère recherché
    cmp byte [rdi], al
    jne getLast
    ;verification de la fin de la chaine
    cmp byte [rdi], 0
    je isNull
    ;si le caractère est trouvé, on stock l'adresse de cette occurrence
    mov rcx, rdi
    ;incrémentation a à l'octet suivant
    inc rdi
    ;incrémentation de la boucle
    jmp for
getLast:
    ;incrémentation a à l'octet suivant si rien n'a été trouvé
    inc rdi
    ;incrémentation de la boucle si le caractère est différent de 0
    cmp byte [rdi], 0
    jne for

isNull:
    cmp dl, 0
    je return
    ;si le caractère n'a pas été trouvé, on retourne NULL
    cmp rcx, rbx
    je returnNull
    ;sinon on retourne l'adresse de la dernière occurrence
    mov rax, rcx
    ret

returnNull:
    xor rax, rax
    ret

return:
    mov rax, rdi
    ret