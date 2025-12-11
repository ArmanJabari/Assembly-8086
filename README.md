# Assembly-8086

## [Print.asm](https://github.com/ArmanJabari/Assembly-8086/blob/main/print.asm)

This program displays a text string on the screen and then exits.

1.  **Prepare to print text**
    -   `mov ah, 9h` tells DOS to use function 09h, which prints a
        string.
    -   `mov dx, offset text` provides the memory address of the string.
2.  **Execute print**
    -   `int 21h` calls DOS to display the string ending with a `$`
        character.
3.  **Exit the program**
    -   `mov ah, 4Ch` selects the DOS exit function.
    -   `int 21h` quits the program.
4.  **Define the text**
    -   `text db 'Hello, World!$'` stores the string.
    -   `$` marks the end of the string for DOS.

## [Input.asm](https://github.com/ArmanJabari/Assembly-8086/blob/main/input.asm)

This program reads input from the user, prints a blank line, and then
displays the entered text.

1.  **Read user input**
    -   `mov ah, 0Ah` selects DOS buffered input.
    -   `mov dx, offset buffer` points to the input buffer.
    -   `int 21h` waits for the user to type text and press Enter.
2.  **Print a new line**
    -   `mov ah, 9h` selects the print‑string function.
    -   `mov dx, offset newline` points to a CR+LF (`0Dh, 0Ah`) string.
    -   `int 21h` prints a blank line.
3.  **Display the user's input**
    -   `mov dx, offset buffer + 2` skips the first two bytes of the
        buffer:
        -   Byte 0: maximum allowed length
        -   Byte 1: actual length typed
    -   From byte 2 onward is the user's text, ending with `$`.
    -   `int 21h` prints the entered text.
4.  **Exit program**
    -   `mov ah, 4Ch` prepares termination.
    -   `int 21h` exits.
5.  **Data definitions**
    -   `buffer db 30` maximum 30 characters input
    -   `db ?` actual number of characters typed
    -   `db 31 dup('$')` space to store the input text
    -   `newline db 0Dh, 0Ah, '$'` newline string
