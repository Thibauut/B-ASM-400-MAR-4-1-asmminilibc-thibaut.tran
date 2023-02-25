global strrchr
strrchr:
for:
    cmp byte [rdi], 0 ; parcours jusqu'à la fin de la chaîne
    je getLastOcc ; appelle la fonction getLastOcc en parcourant la chaîne de la fin
    inc rdi
    jmp for

getLastOcc:
    dec rdi
    cmp byte [rdi], sil ; si le caractère est le même que sil, on appelle la fonction found
    je found
    cmp rdi, 0
    je return
    jmp getLastOcc

found:
    mov rax, rdi ; on stock l'adresse du caractère dans rax et on retourne
    ret
return:
    xor rax, rax ; si le caractère n'est pas trouvé, on retourne 0
    ret