global memset
memset:
    ;stocke le nombre de caractères à écrire changer
    mov rcx, rdx
    ;stocke l'adresse de la zone mémoire à écrire
    mov rax, rdi
    ;stocke le nombre caractère à écrire
    mov dl, sil
    ;si le nombre de caractères à écrire est nul, on retourne

    cmp rcx, 0
    je return
for:
    ;si la zone mémoire à écrire est nul, on retourne
    cmp byte [rdi], 0
    je return
    ;change le caractère à l'adresse rax
    mov byte [rax], dl
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