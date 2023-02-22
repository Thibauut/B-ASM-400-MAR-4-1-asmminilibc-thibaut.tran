global memmove
memmove:
    ; stock l'argument 3
    mov rcx, rdx
    ; si rdi est plus grand que rsi
    cmp rdi, rsi
    jne copy
    ret

copy:
    ; Copie les octets de rsi vers rdi
    ; si rdi est plus petit que rsi
    cmp rdi, rsi
    jbe copyInverted
    lea rdi, [rdi+rcx-1] ; rdi pointe sur le dernier octet
    lea rsi, [rsi+rcx-1] ; rsi pointe sur le dernier octet
    std ; permet d'inverser le sens de la copie, pour copier rsi dans rdi car movsb copie de rdi vers rdi
    rep movsb
    cld ; remet le sens de la copie
    ret

copyInverted:
    ; Copie les octets de rsi vers rdi
    std ; permet d'inverser le sens de la copie, pour copier rsi dans rdi car movsb copie de rdi vers rdi
    rep movsb
    cld ; remet le sens de la copie
    ret
