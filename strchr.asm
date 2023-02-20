global strchr
strchr:
    xor rax, rax
for:
    cmp byte [rdi], 0
    je return
    cmp byte [rdi], dl
    je found
    inc rax
    inc rdi
    cmp byte [rdi], 0
    jne for
    xor rax, rax
found:
    mov rax, rdi
    ret
return:
    ret
