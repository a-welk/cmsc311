.ORIG x3000

        ; Initialize sum to 0
        AND R1, R1, #0

        ; Loop over 10 memory locations
        LD R2, NUMBERS      ; R2 = address of numbers array
        LD R3, COUNT        ; R3 = number of iterations (10)
        ADD R4, R2, #0      ; R4 = current address of number
LOOP    LDR R5, R4, #0      ; R5 = current number
        ADD R1, R1, R5      ; Add current number to sum
        ADD R4, R4, #1      ; Increment address
        ADD R3, R3, #-1     ; Decrement loop counter
        BRnzp LOOP          ; Continue loop if counter > 0

        ; Store result in memory
        STI R1, RESULT

        ; Halt the machine
        HALT

NUMBERS .FILL x3100
        .FILL x3101
        .FILL x3102
        .FILL x3103
        .FILL x3104
        .FILL x3105
        .FILL x3106
        .FILL x3107
        .FILL x3108
        .FILL x3109

COUNT   .FILL #10
RESULT  .FILL x310A

.END
