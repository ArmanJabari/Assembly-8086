mov si, offset text
mov al, [char]
mov bl, 0

next_char:
    mov dl, [si]
    cmp dl, '$'
    je finish

    cmp dl, al
    jne skip
    inc bl

skip:
    inc si
    jmp next_char

finish:
    mov al, bl
    add al, 30h
    mov dl, al
    mov ah, 2h
    int 21h
   
char db "l"
text db "hello world$"