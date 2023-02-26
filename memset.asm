global memset
memset:
    xor rcx, rcx ; rcx = 0
for:
    ;si rdx est égal à rdx on sort de la boucle
    cmp rcx, rdx
    je return
    ;change le caractère à l'adresse rax
    mov byte [rdi + rcx], sil
    ;incrémente le nombre de caractères à écrire
    inc rcx
    ;sinon on boucle
    jmp for
return:
    mov rax, rdi
    ret
