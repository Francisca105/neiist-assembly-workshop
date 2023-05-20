PLACE 1000H
VEC1: WORD 10, 1, 77, 410, 99, 3
VEC2: WORD 7, 10, 53, 3, 4, 0

PLACE 0H

; Calcular produto vetorial de VEC1 * VEC2 e colocar o resultado no R0
; Resultado: 169BH

SIZE EQU 12 ; 6 * NUMERO DE BYTES QUE OCUPA (2)

MOV R0, 0 ; ACUMULADOR
MOV R3, 0 ; COUNTER
MOV R6, SIZE
MOV R4, VEC1
MOV R5, VEC2

ciclo:
    ;ADD R4, R3
    ;ADD R5, R3

    MOV R1, [R4 + R3] ; LER DO VETOR 1 (INDICE R3)
    MOV R2, [R5 + R3] ; LER DO VETOR 2 (INDICE R3)

    MUL R1, R2
    ADD R0, R1 ; ACUMULAR PRODUTO VETORIAL

    ADD R3, 2

    CMP R3, R6
    JNZ ciclo

fim:
    JMP fim