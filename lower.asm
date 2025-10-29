mov si, offset text   

loop_start:
    mov al, [si]      
    cmp al, '$'       
    je  finish         

    cmp al, 'A'
    jb  skip          
    cmp al, 'Z'
    ja  skip         

    add al, 32         
    mov [si], al       

skip:
    inc si             
    jmp loop_start   

finish:
    mov ah, 9h
    mov dx, offset text
    int 21h           

mov ah, 4Ch
int 21h                

text db 'HELLO WORLD$'
