ORG 00h         ;the org directive is used to indicate the beginning of address


HERE:    MOV P1,#0FFH     ;LED P1 IS TURNED ON 
         LCALL DELAY
		 MOV P1,#00H
		 LCALL DELAY
		 SJMP HERE
		 
;DELAY=2*7*255*255*1.085=1s
DELAY:   MOV R0,#07
HERE3:   MOV R1,#255
HERE2:   MOV R2,#255
HERE1:   DJNZ R2,HERE1
         DJNZ R1,HERE2
		 DJNZ R0,HERE3
		 
		 RET

 END