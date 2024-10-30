; Alex Welk - CMSC 311 Lab 3 - 3/26/2023
.ORIG x3000 ; start at memory location x3000

    AND R0, R0, #0     ; Initialize running total to 0
    LD R2, NUMBERS      ; Load memory address of first number

LDR R1, R2, #0 ; Loads first value of NUMBERS into R1
ADD R0, R0, R1 ; Adds the running total and the first value of NUMBERS (R1) and stores in R0
LDR R1, R2, #1 ; Loads second value of NUMBERS into R1
ADD R0, R0, R1 ; Adds second value to total
LDR R1, R2, #2 ; Loads third value of NUMBERS into R1
ADD R0, R0, R1 ; Adds third value to total
LDR R1, R2, #3 ; Loads forth value of NUMBERS into R1
ADD R0, R0, R1 ; Adds fourth value to total
LDR R1, R2, #4 ; Loads fifth value of NUMBERS into R1
ADD R0, R0, R1 ; Adds fifth value to total
LDR R1, R2, #5 ; Loads sixth value of NUMBERS into R1
ADD R0, R0, R1 ; Adds sixth value to total
LDR R1, R2, #6 ; Loads seventh value of NUMBERS into R1
ADD R0, R0, R1 ; Adds seventh value to total
LDR R1, R2, #7 ; Loads eighth value of NUMBERS into R1
ADD R0, R0, R1 ; Adds eighth value to total
LDR R1, R2, #8 ; Loads ninth value of NUMBERS into R1
ADD R0, R0, R1 ; Adds ninth value to total
LDR R1, R2, #9 ; Loads tenth value of NUMBERS into R1
ADD R0, R0, R1 ; Adds tenth value to total

END
    STI R0, SUM ; Store final sum in memory
    HALT ; halts machine

NUMBERS ; fills NUMBERS with value at each memory address
    .FILL x3100         ; Memory address of first number
    .FILL x3101         ; Memory address of second number
    .FILL x3102         ; Memory address of third number
    .FILL x3103         ; Memory address of fourth number
    .FILL x3104         ; Memory address of fifth number
    .FILL x3105         ; Memory address of sixth number
    .FILL x3106         ; Memory address of seventh number
    .FILL x3107         ; Memory address of eighth number
    .FILL x3108         ; Memory address of ninth number
    .FILL x3109         ; Memory address of tenth number


SUM .FILL x310A ; fills x310A with final sum
.END