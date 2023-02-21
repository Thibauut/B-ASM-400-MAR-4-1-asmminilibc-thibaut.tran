global memset
memset:
    ;stocke le 1er argument
    mov rax, rdi
    ;stocke le 2e argument
    mov r12, rsi
    ;stocke le 3e argument
    mov rcx, rdx
    ;si le nombre de caractères à écrire est nul, on retourne
    cmp rcx, 0
    je return
for:
    ;si la zone mémoire à écrire est nul, on retourne
    cmp byte [rdi], 0
    je return
    ;change le caractère à l'adresse rax
    mov byte [rax], r12b
    ;incrémente l'adresse de la zone mémoire à écrire
    inc rax
    ;décrémente le nombre de caractères à écrire
    dec rcx
    ;si le nombre de caractères à écrire est nul, on retourne
    cmp rcx, 0
    je return
    ;sinon on boucle
    jmp for
return:
    mov rax, rdi
    ret