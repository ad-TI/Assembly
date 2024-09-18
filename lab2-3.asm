.ORIG x3000
AND R0, R0, #0 ; and R0 with 0
AND R1, R1, #0 ; and R1 with 0

LD R0, INT1 ; Load INT1 into R0
LD R1, INT2 ; Load INT2 into R1
NOT R1, R1 ; One's complement
ADD R1, R1, #1 ; Two's complement

ADD R2, R1, R0 ; R2 = R1 + R0
; -5 + 5

; if CC: np
BRnp TRUE ; If negative or positive, branch to TRUE

LEA R0, EQUAL ; Load the address stored in NOTLESS into R0
PUTS ; Print string starting at address in R0
; For lab 2 section 3, set R3 equal to 5
BRnzp RETURN ; If N,Z, or P, branch to TRUE

TRUE
LEA R0, NOTEQUAL ; Load the address stored in EQUAL into R0
PUTS ; Print string starting at address in R0
; For lab 2 section 3, set R3 equal to -5
ADD R3, R3, #5

BRnzp RETURN ; If N,Z, or P, branch to RETURN

RETURN
ADD R3, R3, #-5 ; Set R3 to -5
STI R3, RESULT ; Store R3 in RESULT
HALT
; Variables
INT1 .FILL #5
INT2 .FILL #5
NOTEQUAL .STRINGZ "Not equal"
EQUAL .STRINGZ "Equal"
RESULT .FILL x8002
.END
