global strcspn
strcspn:
    ; initialisation
    mov r8, 0 ; taille de la chaine rsi
    mov r9, 0 ; taille de la chaine rdi
    mov r10, 0 ; caractère courant de la chaine rdi
    mov r11, 0 ; compteur du caractère trouvé
    mov r12, 0 ; compteur de la chaine rdi
    mov rcx, 0 ; compteur de la chaine rsi
getSize1: ; on récupère la taille de la chaine rdi
    cmp byte [rdi + r9], 0
    je getSize2
    inc r9
    jmp getSize1
getSize2: ; on récupère la taille de la chaine rsi
    cmp byte [rsi + r8], 0
    je for
    inc r8
    jmp getSize2
for:
    mov rcx, 0 ; on réinitialise le compteur de la chaine rsi
    mov r10b, [rdi + r12] ; stocke le caractère courant de la chaine rdi
    cmp r10b, 0 ; fin de la chaine
    je returnEmpty ; retourne la taille de la chaine rdi
    jmp found ; sinon, on cherche le caractère
found:
    cmp rcx, r8 ; fin de la chaine rsi
    je next ; on passe au caractère suivant de la chaine rdi
    cmp r10b, [rsi + rcx] ; on stocke le caractère courant de la chaine rsi
    je return ; on retourne le compteur du caractère trouvé
    inc rcx ; on incrémente le compteur de la chaine rsi
    jmp found
next:
    inc r11 ; on incrémente le compteur du caractère trouvé
    inc r12 ; on incrémente le compteur de la chaine rdi
    jmp for
return:
    mov rax, r11
    ret
returnEmpty:
    mov rax, r9
    ret