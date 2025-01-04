.ORIG x3000
; R0 = x
; R1 = y
; R2 = i
; R3 = j
; R4 = accumulator/result
; R5 = loopvar


; Exponential to addition
; 2^3 = 2 * 2 * 2
; = 2 + 2 + 2 + 2
; = 4 + 2 + 2
; = 6 + 2 = 8
LD R0, INTX ; R0 = x
LD R1, INTY ; R1 = y

AND R2, R2, #0 ; R2 = 0
AND R3, R3, #0 ; R3 = 0
AND R4, R4, #0 ; R4 = 0

; Base Cases
; x^0 = 1
; 0^y = 0

; Check for 0^y
ADD R1, R1, #0 ; R1 + 0
BRz YZERO
; Check for x^0
ADD R0, R0, #0 ; R0 + 0
BRz XZERO

ADD R5, R0, #0 ; R5 = R0
NOT R5, R5 ; one's complement
ADD R5, R5, #1 ; two's complement
; Multiplication
LOOP
    ADD R4, R4, R0 ; R4 += R0

    ADD R2, R2, #1 ; i++
    ADD R6, R2, R5 ; i < 2
    BRnp LOOP
ENDLOOP

YZERO
    ADD R4, R4, #1 ; R4 += 1
BRnzp DONE
XZERO
    ADD R4, R4, #0 ; R4 += 0

DONE
STI R4, RESULT ; store R4 in RESULT's address
HALT
INTX .FILL #2
INTY .FILL #3
RESULT .FILL xAFEC
.END
