global strrchr
strrchr:
    ;initialisation de rax à 0
    xor rax, rax
    ;sauvegarde de la premiere adresse de la chaine
    mov rbx, rdi
    ;initialisation de rcx au pointeur de la chaine
    mov rcx, rdi
for:
    ;verification de la fin de la chaine
    cmp byte [rdi], 0
    je isNull
    ;comparaison de l'octet courant avec le caractère recherché
    cmp byte [rdi], dl
    jne getLast
    ;si le caractère est trouvé, on stock l'adresse de cette occurrence
    mov rcx, rdi
    ;incrémentation a à l'octet suivant
    inc rdi
    inc rax
    ;incrémentation de la boucle
    jmp for
getLast:
    ;incrémentation a à l'octet suivant si rien n'a été trouvé
    inc rdi
    ;incrémentation de la boucle si le caractère est différent de 0
    cmp byte [rdi], 0
    jne for
isNull:
    ;si le caractère n'a pas été trouvé, on retourne NULL
    cmp rcx, rbx
    je returnNull
    ;sinon on retourne l'adresse de la dernière occurrence
    mov rax, rcx
    ret

returnNull:
    xor rax, rax
    ret
