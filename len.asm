mov si, offset text
xor cx, cx

count_loop:
    mov al, [si]
    cmp al, '$'
    je done_count
    inc cx
    inc si
    jmp count_loop

done_count:
    mov ax, cx
    call print_number

    mov ah, 4Ch
    int 21h

print_number proc
    mov bx, 10
    xor cx, cx 
    
next_digit:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz next_digit
    
print_digits:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop print_digits
    ret            
    
print_number endp

text db 'hello, world!$'
