global memcpy
memcpy:
    ;stocke l'adresse de la zone mémoire à écrire
    mov rdi, rdi
    ;stock l'adresse de la zone mémoire à copier
    mov rsi, rsi
    ;initialise le nombre de caractères à écrire
    mov rcx, 0
    mov r12, 0
for:
    ;on copie le caractère
    cmp rcx, rdx
    je return
    ;on l'écrit dans la zone mémoire, destination
    mov r12b, byte rsi[rcx]
    mov byte rdi[rcx], r12b
    ;décrémente le nombre de caractères à écrire
    inc rcx
    ;si le nombre de caractères à écrire est nul, on retourne
    ;sinon on boucle
    jmp for
return:
    mov rax, rdi
    ret