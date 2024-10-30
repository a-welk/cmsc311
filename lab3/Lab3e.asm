.ORIG x3000 ; Start of program

    AND R0, R0, #0 ; Clear R0
    LD R1, NUMBERS ; Load the address of the first number
    LD R2, RESULT ; Load the address to store the result
    ADD R3, R3, #10 ; Counter for the loop
    
SUM_LOOP
    LDR R4, R1, #0 ; Load the current number
    ADD R0, R0, R4 ; Add it to the accumulator
    ADD R1, R1, #1 ; Increment the pointer to the next number
    ADD R3, R3, #-1 ; Decrement the counter
    BRnzp SUM_LOOP ; Loop if counter is not zero

    STI R2, RESULT ; Store the result

    HALT ; End of program

NUMBERS .FILL x3100 ; Address of first number
RESULT  .FILL x310A ; Address to store the result

.END ; End of program
