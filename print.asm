mov ah, 9h
mov dx, offset text
int 21h

mov ah, 4Ch
int 21h

text db 'Hello, World!$'