PLACE 1000H

VEC1: WORD 10, 1, 77, 410, 99, 3
VEC2: WORD 7, 10, 53, 3, 4, 0
VEC3: WORD 0, 4, 1, 5, 7, 13

SIZE EQU 12 ; 6 * NUMERO DE BYTES QUE OCUPA (2)


STACK 100H
        SP_init:

PLACE 0

; Calcular produto vetorial de VEC1 * VEC2 + VEC2 * VEC3 e colocar o resultado no R0
; Resultado: 1723H
; Utilizar uma rotina

MOV SP, SP_init

MOV R4, VEC1
MOV R5, VEC2

CALL produto_vetorial
MOV R1, R0 ; Guardar o resultado da operação

MOV R4, VEC2
MOV R5, VEC3

CALL produto_vetorial

ADD R1, R0

;; Quando chama a rotina
; R4 - Primeiro vetor
; R5 - Segundo vetor
; R0 - Resultado da operação

produto_vetorial:
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6



    MOV R0, 0 ; ACUMULADOR
    MOV R3, 0 ; COUNTER
    MOV R6, SIZE



ciclo:
    MOV R1, [R4 + R3] ; LER DO VETOR 1 (INDICE R3)
    MOV R2, [R5 + R3] ; LER DO VETOR 2 (INDICE R3)

    MUL R1, R2
    ADD R0, R1 ; ACUMULAR PRODUTO VETORIAL

    ADD R3, 2

    CMP R3, R6
    JNZ ciclo

    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1

fim:
    JMP fim