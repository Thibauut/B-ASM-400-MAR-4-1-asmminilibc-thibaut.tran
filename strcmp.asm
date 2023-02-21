global strcmp
strcmp:
    ;stocke l'adresse de la zone mémoire 1
    mov rdi, rdi
    ;stock l'adresse de la zone mémoire 2
    mov rsi, rsi

for:
    ;si la zone mémoire 1 est nul, on retourne
    cmp byte [rdi], 0
    je returnEqual
    ;si la zone mémoire 2 est nul, on retourne
    cmp byte [rsi], 0
    je returnLessThan1
    ;on compare les deux caractères
    mov al, [rdi]
    mov bl, [rsi]
    cmp al, bl
    ;incrémente le pointeur de la première zone mémoire si les deux caractères sont égaux
    je next
    cmp al, bl
    jl returnNotEqual
    ret

next:
    ;incrémente le pointeur de la première zone mémoire
    inc rsi
    inc rdi
    jmp for

returnNotEqual:
    ;retourne le résultat de la comparaison
    mov eax, 0
    ret

returnEqual:
    ;retourne le résultat de la comparaison
    mov eax, 0
    ret

returnLessThan1:
    ;retourne le résultat de la comparaison
    mov eax, 1
    ret

returnLessThan2:
    ;retourne le résultat de la comparaison
    mov eax, -1
    ret