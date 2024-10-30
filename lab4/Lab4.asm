; Alex Welk - CMSC311 Lab 4 - 4/12/22
.ORIG x3000
LD R0, NUMBERstart
LD R1, NUMBERend ; loads memory address of the x32FF into R1 to compare to current memory address
AND R2, R2, #0 ; initialize R2 to 0 to store sum
LOOP
	AND R3, R3, #0 ; initialize R3 to 0
	LDR R5, R0, #0 ; loads value from memory address to R5
	LDR R3, R0, #0 ; loads value from memory address to R3
	ADD R0, R0, #1 ; moves to next number in memory location set
	AND R3, R3, #1 ; masks out all least significant bits to check for odd or even
	BRz SKIP ; if LSB is 0 then don't add to sum and skip
	ADD R2, R2, R5 ; if LSB is not zero then add current number to sum in R2
SKIP
	AND R4, R0, R1 ; compares current memory address to x32FF
	BRp LOOP ; if memory address' don't match then branch back to LOOP
STI R2, SUM ; store R2 sum into SUM label

HALT

NUMBERend .FILL x32FF
SUM .FILL x3300 ;fills x3300 with total sum
NUMBERstart .FILL x3200
	.BLKW x0100
.END