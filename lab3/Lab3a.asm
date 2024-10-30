; starting at memory location 3000
.ORIG x3000

	; clearing R0 to store the sum
    AND R0, R0, #0
	; load address of first nuber
    LD R1, SUM
	; loads the number 10
    LD R2, TEN
LOOP
	; add the current number to the sum
    ADD R0, R0, R1
	; increment the memory address
    ADD R1, R1, #1
	; decrement the counter
    ADD R2, R2, #-1
	; continues to loop while R2 is positive
    BRp LOOP

	; stores the sum at x310A
    ST R0, RESULT
    HALT
	; address of first num
SUM .FILL x3100
TEN .FILL #10
	; allocation for result
RESULT .BLKW #1
.END