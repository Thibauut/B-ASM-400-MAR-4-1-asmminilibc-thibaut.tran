strstr:
    mov rax, 0 ; sauvegarde de rdi dans rax

for:
    ; stock le premier caractère de la chaine rsi dans r8b
    mov r8b, byte [rsi]
    ; si le caractère est nul, on a trouvé la sous-chaine
    cmp byte [rdi], r8b
    ; si il sont égaux, on continue la recherche
    je next
    ; si on a atteint la fin de la chaine, on retourne NULL
    cmp byte [rdi], 0
    je return
    ; sinon, on retourne au début de la boucle
    inc rdi
    jmp for

found:
    ; si la sous-chaine est trouvée, on retourne le pointeur
    mov rax, rdi
    ret

next:
    ; incrémente les pointeurs
    inc rdi
    inc rsi
    ; si on a atteint la fin de la sous-chaine, on a trouvé
    cmp byte [rsi], 0
    je found
    ; sinon, on boucle
    jmp for

return:
    ; si la sous-chaine n'est pas trouvée, on retourne NULL
    xor rax, rax
    ret
