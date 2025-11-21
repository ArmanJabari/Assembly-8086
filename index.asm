mov si, offset text
mov al, [char]
xor bl, bl            

next_char:
    mov dl, [si]
    cmp dl, '$'
    je not_found

    cmp dl, al
    je found

    inc si
    inc bl
    jmp next_char

found:
    mov ax, bx      
    call print_num
    jmp finish

not_found:
    mov dl, '0'
    mov ah, 2
    int 21h
    jmp finish

print_num proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

.convert:
    xor dx, dx
    div bx        
    push dx         
    inc cx
    cmp ax, 0
    jne .convert

.print:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop .print

    pop dx
    pop cx
    pop bx
    pop ax

print_num endp

finish:
    mov ah, 4Ch
    int 21h

char db 'l'
text db 'hello world$'