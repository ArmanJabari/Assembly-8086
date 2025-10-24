mov ah, 0Ah
mov dx, offset buffer
int 21h

mov ah, 9h
mov dx, offset newline 
int 21h

mov ah, 9h
mov dx, offset buffer + 2
int 21h

mov ah, 4Ch
int 21h

buffer db 30
       db ?
       db 31 dup('$')

newline db 0Dh, 0Ah, '$'
