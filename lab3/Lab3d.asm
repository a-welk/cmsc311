.ORIG x3000              ; Start of program

    LD R0, START        ; Load address of first number into R0
    AND R1, R1, #0      ; Clear R1 to store the sum
    AND R2, R2, #0      ; Clear R2 to store the loop counter
    AND R3, R3, #10     ; Load the loop counter with 10
    
LOOP ADD R1, R1, R0     ; Add the current number to the sum
    ADD R0, R0, #1      ; Increment to the next number
    ADD R2, R2, #1      ; Increment the loop counter
    BRnz LOOP           ; Branch back to LOOP while loop counter is not zero

    STI R1, RESULT       ; Store the result of the addition at x310A
    HALT                ; Halt the machine

START .FILL x3100        ; Memory address of the first number
RESULT .FILL x310A      ; Memory address to store the result

.END                    ; End of program
