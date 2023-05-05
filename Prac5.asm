LIST p=16F877 ;Tipo de procesador

INCLUDE <P16F877.INC> ;Librerias
ORG 0x00 ;Inicio de programa

	DATO1 EQU 0X20
	DATO2 EQU 0X21
	OPERACION EQU 0X22

	
	BCF STATUS,RP0 ; Accede a banco 0
	BCF STATUS,RP1 
		
	CLRF PORTD ; Limpia PORTD
	CLRF PORTB

	BSF STATUS,RP0 ; Accede a banco 1

	MOVLW	b'11110000'
	MOVWF TRISB
	MOVLW	b'00000000'
	MOVWF TRISD

	BCF STATUS,RP0 ; Regresa a banco 0

CICLO
	;----------------------------------------------------------------------------------------------------------------
	;FILA 0
	;----------------------------------------------------------------------------------------------------------------
	CLRF PORTB ;FILA 1
	BSF PORTB,0

	BTFSC PORTB,4 
 	GOTO SIETE
	
	BTFSC PORTB,5 
 	GOTO OCHO
	
	BTFSC PORTB,6
 	GOTO NUEVE


	;----------------------------------------------------------------------------------------------------------------
	;FILA 1
	;----------------------------------------------------------------------------------------------------------------
	CLRF PORTB
	BSF PORTB,1 ;FILA 2

	BTFSC PORTB,4 
 	GOTO CUATRO
	
	BTFSC PORTB,5 
 	GOTO CINCO

	BTFSC PORTB,6
 	GOTO SEIS
	CLRF PORTB
	;----------------------------------------------------------------------------------------------------------------
	;FILA 2
	;----------------------------------------------------------------------------------------------------------------
	CLRF PORTB 
	BSF PORTB,2 ;FILA 2

	BTFSC PORTB,4 
 	GOTO UNO
	
	BTFSC PORTB,5 
 	GOTO DOS

	BTFSC PORTB,6
 	GOTO TRES
	;----------------------------------------------------------------------------------------------------------------
	;FILA 3
	;----------------------------------------------------------------------------------------------------------------
	CLRF PORTB 
	BSF PORTB,3 ;FILA 3

	BTFSC PORTB,4 
 	GOTO CLR

	BTFSC PORTB,5 
 	GOTO CERO
	
	BTFSC PORTB,6 
 	GOTO IGUAL

	BTFSC PORTB,7
 	GOTO SUMA
	

	GOTO CICLO 

	;----------------------------------------------------------------------------------------------------------------
	;NUMEROS
	;----------------------------------------------------------------------------------------------------------------

	SIETE
	MOVLW 07h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 


	OCHO
	MOVLW 08h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 


	NUEVE
	MOVLW 09h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 

	;----------------------------------------------------------------------------------------------------------------
	;FILA 1
	;----------------------------------------------------------------------------------------------------------------

	CUATRO
	MOVLW 04h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 


	CINCO
	MOVLW 05h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 



	SEIS
	MOVLW 06h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 
	
	;----------------------------------------------------------------------------------------------------------------
	;FILA 2
	;----------------------------------------------------------------------------------------------------------------

	UNO
	MOVLW 01h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 


	DOS
	MOVLW 02h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 



	TRES
	MOVLW 03h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO 
	
	;----------------------------------------------------------------------------------------------------------------
	;FILA 3
	;----------------------------------------------------------------------------------------------------------------

	CLR
	CLRF PORTD
	GOTO CICLO

	CERO
	MOVLW 00h
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO
	
	IGUAL	
	MOVF DATO1,W
	ADDWF DATO2,W
	MOVWF RESULTADO
	MOVF RESULTADO,W
	CALL TABLA
	MOVWF PORTD
	GOTO CICLO

	SUMA
	BSF OPERACION,0
	GOTO CICLO
	
	


	


TABLA 
ADDWF PCL,F
	RETLW	b'00111111' ;Numero 0
	RETLW	b'00000110' ;Numero 1
	RETLW	b'11011011' ;Numero 2
	RETLW	b'01001111' ;Numero 3
	RETLW	b'01100110' ;Numero 4
	RETLW	b'01101101' ;Numero 5
	RETLW	b'01111101' ;Numero 6
	RETLW	b'00000111' ;Numero 7
	RETLW	b'01111111' ;Numero 8
	RETLW	b'01100111' ;Numero 9
 
END ; Fin de programa

