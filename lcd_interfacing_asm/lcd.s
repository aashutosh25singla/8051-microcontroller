ORG 00H
	
;   RS     RW     E       D0 -  D7
;   P2.0   P2.1   P2.2   P1.0 - P1.7

//#define
RS EQU P2.0
RW EQU P2.1
E  EQU P2.2

;LCD INITIALIZATION

 MOV P1, #38H   ;2 lines and 5x7 matrix
ACALL send_command

MOV P1, #0EH  ;display on cursor blink
ACALL send_command

MOV P1, #01H	;clear display screen
ACALL  send_command


here:	MOV P1, #80H	; FORCE CURSOR TO 1ST LINE
	ACALL  send_command
           ;PRINTING A CHARACTER

	MOV P1, #'E'
	ACALL send_data
	MOV P1, #'M'
	ACALL send_data
	MOV P1, #'B'
	ACALL send_data
	MOV P1, #'E'
	ACALL send_data
	MOV P1, #'D'
	ACALL send_data
	MOV P1, #'D'
	ACALL send_data
	MOV P1, #'E'
	ACALL send_data
	MOV P1, #'D'
	ACALL send_data	
	
	MOV P1, #0C0H	; FORCE CURSOR TO 2ND LINE
	ACALL  send_command
	
	MOV P1, #'L'
	ACALL send_data
	MOV P1, #'A'
	ACALL send_data
	MOV P1, #'B'
	ACALL send_data	
	
	SJMP here

send_command:   CLR RW
				CLR RS
				SETB E
				ACALL DELAY
				CLR E
				RET

send_data:      CLR RW
				SETB RS
				SETB E
				ACALL DELAY
				CLR E
				RET

DELAY : MOV R0, #10
Here2 : MOV R1, #255
Here1 : DJNZ R1, here1
		   DJNZ R0, here2
          
		  RET


END
