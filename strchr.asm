global strchr
strchr:
    ; stocker le deuxieme argument
    mov rax, rsi
for:
    ;comparaison de l'octet courant avec le caractère recherché
    cmp byte [rdi], al
    je found
    ;verification de la fin de la chaine
    cmp byte [rdi], 0
    je return
    ;incrémentation a à l'octet suivant
    inc rdi
    jmp for
found:
    ;si le caractère est trouvé, on retourne l'adresse de l'octet
    mov rax, rdi
    ret
return:
    ;si le caractère n'est pas trouvé, on retourne NULL
    xor rax, rax
    ret
