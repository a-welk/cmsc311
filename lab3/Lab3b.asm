	; starts at memory location x3000
.ORIG x3000

	; clears R0 to store the sum
    AND R0, R0, #0
	; load the address of the first number
    LD R1, SUM
	; load the number 10
    LD R2, TEN
LOOP
	; loads the current number into R3
    LDR R3, R1, #0
	; adds the current number to the sum
    ADD R0, R0, R3
	; increments memory address
    ADD R1, R1, #1
	; decrements counter
    ADD R2, R2, #-1
	; continues to loop while R2 is positive
    BRp LOOP

	; store the final sum at memory location x310A
    STI R0, RESULT
	; halts the machine
    HALT

	; address of the first number
SUM .FILL x3100
	; number of values to sum
TEN .FILL #10
	; space to store the result
RESULT .BLKW #1
.END
