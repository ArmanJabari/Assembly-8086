mov si, offset text 
mov al, oldchar     
mov bl, newchar     

replace_loop:
    mov dl, [si]       
    cmp dl, '$'        
    je finish

    cmp dl, al         
    jne next_char
    mov [si], bl       

next_char:
    inc si             
    jmp replace_loop

finish:
    mov dx, offset text
    mov ah, 09h
    int 21h

    mov ah, 4Ch          
    int 21h        
   
oldchar db 'l'
newchar db 'i'
text    db 'hello world$'