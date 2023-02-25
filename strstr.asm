strstr:
    mov rax, 0
    mov r8, 0 ; compteur longueur de rsi
    mov r9, 0 ; compteur de comparaison de rsi et rdi
checkSize: ; récupere la longueur de rsi
    cmp byte [rsi + r8], 0
    je checkSubStr
    inc r8
    jmp checkSize
checkSubStr:
    mov r12b, [rdi] ; r12b = caractère de rdi
    mov r13b, [rsi] ; r13b = caractère de rsi
    cmp r12b, 0 ; vérifie si la chaîne rdi est vide
    je returnNull
    cmp r12b, r13b ; vérifie si un caractère de rsi est égal a un caractère de rdi
    je foundSubStr ; si oui, on passe à la fonction foundSubStr pour vérifier si la chaîne est présente
    inc rdi
    jmp checkSubStr
foundSubStr:
    cmp r9, r8 ; si le compteur de rsi est égal à la longueur de rsi, on a trouvé la chaîne
    je return
    mov r12b, [rdi + r9] ; r12b = caractère suivant de rdi a partir du caractère trouvé
    mov r13b, [rsi + r9] ; r13b = caractère suivant de rsi a partir du caractère trouvé
    cmp r12b, r13b ; vérifie si le caractère suivant de rsi est égal au caractère suivant de rdi
    jne next ; si non, on passe au caractère suivant de rdi
    inc r9
    jmp foundSubStr
next:
    inc r9
    jmp foundSubStr
return:
    xor rax, rdi
    ret
returnNull:
    cmp byte [rsi], 0 ; vérifie si la chaîne rsi est vide
    je return ; si oui, retourne rdi
    xor rax, rax ; sinon, retourne null
    ret
