Program to multiply an integer by the number 6
;
.ORIG x3000
LD R1, SIX
LD R2, NUMBER
AND R3, R3, #0 ; clear R3 to hold the product
;
; The inner loop
;
AGAIN ADD R3, R3, R2
ADD R1, R1, #-1 ; keep track of iterations
BRp AGAIN
;
HALT
;
NUMBER .BLKW #1
SIX .FILL x0006
;
.END
