.ORIG x3000
; R0 = keyboard/string buffer
; R1 = i
; R2 = loop var
; R3 = -n
; R4 = array address
AND R1, R1, #0 ; R1 = 0

LD R3, INTN ; load INTN to R3
NOT R3, R3 ; one's complement
ADD R3, R3, #1 ; two's complement

LEA R4, ARRAY ; load address of ARRAY to R4

FORLOOP
    LD R0, NL ; R0 = lf
    TRAP x21 ; output lf

    LEA R0, PROMPT ; load address of prompt
    TRAP x22 ; print string

    TRAP x20 ; get character from user
    TRAP x21 ; echo character to user

    STR R0, R4, #0 ; store R0 in the address at R4

    ; complete requirement c

    ADD R1, R1, #1 ; i++
    ADD R4, R4, #1 ; next element of array

    ADD R5, R1, R3 ; R5 = i - n
    BRz DONE ; if zero, finish loop
    BRnzp FORLOOP ; restart loop
ENDLOOP

DONE

HALT
PROMPT .STRINGZ "Enter a number between 0 - 9: "
ARRAY .BLKW #20
INTN .FILL #5
NL .FILL xA
.END
