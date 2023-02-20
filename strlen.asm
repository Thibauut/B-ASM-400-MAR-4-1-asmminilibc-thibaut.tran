global strlen

strlen:
    xor rax, rax

for:
    cmp byte [rdi], 0
    je return
    inc rax
    inc rdi
    cmp byte [rdi], 0
    jne for

return:
    ret
