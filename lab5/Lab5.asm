.ORIG x3000
LEA R0, STARTstring
PUTS ; prints STARTstring prompting user for input

LD R0, NUMBERstart ; loads starting address of x3200
LD R1, NUMBERend ; loads ending address of x32FF

pollingLoop ;polling loop to constantly check for an input
LD R2, KBSR
LDR R4, R2, #0
BRz pollingLoop

AND R4, R4, #0 ; initialize R4 to 0
LD R3, KBDR ; loads value into R3
ADD R3, R3, #-16
ADD R3, R3, #-16
ADD R3, R3, #-16
AND R3, R3, #1 ; compares value in R3 to 1 to see if we should add odd or even
BRp ODDLOOP ; if values are the same then we add odd and branch to ODDLOOP

EVENLOOP 
	LDR R5, R0, #0 ; loads value of memory address into R5
	LDR R6, R0, #0 ; loads value of memory address into R6
	ADD R0, R0, #1 ; moves to next memory location in R0
	AND R6, R6, #1 ; masks out LSB to check for odd or even
	BRnp EVENSKIP ; if the value is odd, don't add and go to EVENSKIP
	ADD R4, R4, R5
EVENSKIP
	AND R4, R0, R1 ;compares current memory address to end memory address
	BRp EVENLOOP ; loops if addresses are not the same
	AND R4, R0, R1 ; compares current address to end address
	BRz ENDLOOP ; goes to ENDLOOP if they are the same

ODDLOOP
	LDR R5, R0, #0 ; loads value of memory address into R5
	LDR R6, R0, #0 ; loads value of memory address into R6
	ADD R0, R0, #1 ; moves to next memory location in R0
	AND R6, R6, #1 ; masks out LSB to check for odd or even
	BRz ODDSKIP ; If value is even, don't add value and go to ODDSKIP
	ADD R4, R4, R5
ODDSKIP
	AND R3, R0, R1 ; comparing memory location to final location
	BRp ODDLOOP

ENDLOOP
STI R4, SUM
LEA R1, ENDstring
PUTS
LDR R4, R4, #0
OUT

HALT
KBSR .FILL xFE00
KBDR .FILL xFE02
DDR .FILL xFE06
ENDstring .STRINGZ "the sum of values was: \n"
STARTstring .STRINGZ "Please enter a 1 to sum all odd numbers. Otherwise all even numbers will be summed\n"
NUMBERend .FILL x32FF
SUM .FILL x3300 ;fills x3300 with total sum
NUMBERstart .FILL x3200
	.BLKW x0100
.END