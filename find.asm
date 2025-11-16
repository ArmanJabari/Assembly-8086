mov si, offset text
mov al, char

next_char:
    mov bl, [si]
    cmp bl, '$'
    je not_found
    cmp bl, al
    je found
    inc si  
    jmp next_char
    
found:
    mov dx, offset true
    mov ah, 9h
    int 21h
    
    jmp finish
           
not_found:
    mov dx, offset false
    mov ah, 9h
    int 21h
    
    
finish:
    mov ah, 4Ch
    int 21h   
    
text db "hello world$"
char db 'l'
true db "True$"
false db "False$"