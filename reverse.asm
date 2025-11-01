mov si, offset text    
mov di, si              

find_end:
    mov al, [di]
    cmp al, '$'
    je  start_reverse
    inc di
    jmp find_end

start_reverse:
    dec di             

reverse_loop:
    cmp si, di          
    jge done

    mov al, [si]       
    mov bl, [di]      

    mov [si], bl      
    mov [di], al

    inc si              
    dec di              
    jmp reverse_loop

done:
    mov ah, 9h
    mov dx, offset text
    int 21h            

mov ah, 4Ch
int 21h                

text db 'Hello, World!$'
