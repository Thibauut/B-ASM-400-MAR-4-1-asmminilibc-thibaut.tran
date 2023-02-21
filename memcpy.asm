global memcpy
memcpy:
    ;stocke l'adresse de la zone mémoire à écrire
    mov rdi, rdi
    ;stock l'adresse de la zone mémoire à copier
    mov rsi, rsi
    ;stocke le nombre caractère à écrire
    mov rcx, rdx
    ;si le nombre de caractères à écrire est nul, on retourne
    cmp rcx, 0
    je return
for:
    ;si la zone mémoire à écrire est nul, on retourne
    cmp byte [rdi], 0
    je return
    ;on copie le caractère
    mov al, [rsi]
    ;on l'écrit dans la zone mémoire, destination
    mov [rdi], al
    ;on incrémente les adresses
    inc rsi
    inc rdi
    ;décrémente le nombre de caractères à écrire
    dec rcx
    ;si le nombre de caractères à écrire est nul, on retourne
    cmp rcx, 0
    je return
    ;sinon on boucle
    jmp for
return:
    ret