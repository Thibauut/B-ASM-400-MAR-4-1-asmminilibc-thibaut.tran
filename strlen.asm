global strlen

strlen:
    xor rax, rax
    cmp byte [rdi], 0
    je return
for:
    inc rax
    inc rdi
    cmp byte [rdi], 0
    jne for

return:
    ret