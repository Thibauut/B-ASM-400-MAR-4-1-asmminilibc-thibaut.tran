global strcspn
strcspn:
    mov r8, rdi ; sauvegarde de rdi
    mov r9, rsi ; sauvegarde de rsi
    ; initialisation du compteur
    xor rax, rax
    xor rcx, rcx
for:
    mov r8b, [rdi] ; stocke le pointeur vers le premier caractère de rdi dans r8
    cmp r8b, 0 ; si le caractère est 0, on sort de la boucle car on a atteint la fin de la chaîne
    je endFor ; on sort de la boucle
    mov rsi, r9 ; on remet rsi à sa valeur initiale
    xor rcx, rcx
for2:
    mov r9b, [rsi] ; stocke le pointeur vers le premier caractère de rsi dans r9
    cmp r9b, 0 ; si le caractère est 0, on sort de la boucle
    je endFor2 ; on sort de la boucle
    cmp r8b, r9b ; on compare les deux caractères
    je found ; si ils sont égaux, on a trouvé le caractère
    inc rsi ; on incrémente rsi
    jmp for2 ; on recommence la boucle
found:
    mov rax, rcx
    ret
endFor2:
    inc rdi ; on incrémente rdi
    jmp for ; on recommence la boucle for pour le prochain caractère de rdi
endFor:
    mov rax, rcx
    ret
