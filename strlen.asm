global strlen
strlen:
    ;initialisation de rax à 0
    xor rax, rax
for:
    ;verification de la fin de la chaine
    cmp byte [rdi], 0
    je return
    ;incrémentation a à l'octet suivant
    inc rdi
    ;incrémentation de la boucle si le caractère est différent de 0
    cmp byte [rdi], 0
    jne for
return:
    ret
