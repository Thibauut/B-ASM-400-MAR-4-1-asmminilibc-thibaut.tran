global strpbrk
strpbrk:
    mov rax, 0
    mov r8, rdi ; sauvegarde de rdi
    mov r9, rsi ; sauvegarde de rsi
for:
    mov r12b, [rdi] ; stocke un caractère de rdi dans r12
    cmp r12b, 0 ; si le caractère est 0, on sort de la boucle
    je endFor ; on sort de la boucle
    mov rsi, r9 ; on remet rsi à sa valeur initiale
for2:
    mov r13b, [rsi] ; stocke un caractère de rsi dans r13
    cmp r13b, 0 ; si le caractère est 0, on sort de la boucle
    je endFor2 ; on sort de la boucle
    cmp r12b, r13b ; on compare les deux caractères
    je found ; si ils sont égaux, on a trouvé le caractère
    inc rsi ; on incrémente rsi
    jmp for2 ; on recommence la boucle

found:
    mov rax, rdi ; on stocke l'adresse du caractère trouvé dans rax
    ret
endFor2:
    inc rdi
    jmp for
endFor:
    ret
