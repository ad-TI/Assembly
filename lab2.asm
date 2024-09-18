.ORIG x3000
AND R0, R0, #0 ; and R0 with 0
AND R1, R1, #0 ; and R1 with 0
AND R2, R2, #0 ; and R2 with 0

; R0 = counter
; R1 = i
; R2 = loop var
; R3 = iterations
LD R3, ITERATIONS ; Load ITERATIONS into R3
ADD R2, R3, #0 ; R2 = R3 + 0
NOT R2, R2 ; One's complement
ADD R2, R2, #1 ; Two's complement

FORLOOP
    ADD R0, R0, #5 ; counter += 5
    ADD R1, R1, #1 ; i++
    
    ADD R4, R1, R2 ; R4 = i - iterations
    BRz LOOPDONE ; if zero, branch to LOOPDONE
BRnzp FORLOOP ; always branch to FORLOOP

LOOPDONE
STI R0, RESULT ; Store R0 in RESULT
HALT
; Variables
ITERATIONS .FILL #10 ; int iterations
RESULT .FILL x90A2 ; memory address
.END
