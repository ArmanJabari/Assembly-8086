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

## [Len.asm](https://github.com/ArmanJabari/Assembly-8086/blob/main/len.asm)
This program calculates the length of a `$`‑terminated string and prints the number of characters before exiting.

1. **Initialize pointer and counter**  
    - `mov si, offset text` loads the address of the string into the `SI` register.  
    - `xor cx, cx` clears the `CX` register, which will hold the character count.

2. **Count characters until `$`**  
    - `count_loop:` begins a loop that:  
        - `mov al, [si]` reads the current character.  
        - `cmp al, '$'` checks if it’s the DOS string terminator.  
        - `je done_count` jumps out of the loop if the terminator is found.  
        - `inc cx` increments the character counter.  
        - `inc si` moves to the next character.  
        - `jmp count_loop` repeats the loop.

3. **Print the length**  
    - `done_count:` marks the end of counting.  
    - `mov ax, cx` copies the count into `AX`.  
    - `call print_number` invokes a helper procedure to display the number in decimal.

4. **Exit the program**  
    - `mov ah, 4Ch` selects the DOS exit function.  
    - `int 21h` terminates the program.

5. **Procedure: `print_number`**  
    - Converts the unsigned 16‑bit integer in `AX` to decimal ASCII and prints it:  
        - `mov bx, 10` sets up division by 10.  
        - Digits are computed using repeated division (`div bx`) and pushed onto the stack.  
        - `cx` counts how many digits were pushed.  
        - After division completes (`test ax, ax` is zero), digits are popped, converted to ASCII (`add dl, '0'`), and printed one by one using DOS function `02h`.  
        - `loop print_digits` ensures all digits are output.  
        - `ret` returns control to the caller.

6. **Data definition**  
    - `text db 'hello, world!$'` stores the sample string, ending with `$` as required by DOS string functions.
