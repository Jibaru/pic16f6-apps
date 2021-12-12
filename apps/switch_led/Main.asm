LIST P=PIC16F628A
INCLUDE <P16F628A.INC>

TIEMPO EQU 21H

    ORG 0x00
    GOTO INICIO

INICIO
    BSF	    STATUS,5
    CLRF    TRISB
    BSF	    TRISA,0
    BCF	    STATUS,5

BUCLE
    BTFSS   PORTA,0
    GOTO    OPC1
    GOTO    OPC2

OPC1
    BSF	    PORTB,0
    CALL    RETAR1
    BCF	    PORTB,0
    CALL    RETAR1
    GOTO    BUCLE

OPC2
    BSF	    PORTB,0
    CALL    RETAR2
    BCF	    PORTB,0
    CALL    RETAR2
    GOTO    BUCLE

RETAR1
    MOVLW   0xFF
    MOVWF   TIEMPO

RET
    DECFSZ TIEMPO,1
    GOTO RET
    RETURN

RETAR2
    CALL RETAR1
    CALL RETAR1
    RETURN

END


