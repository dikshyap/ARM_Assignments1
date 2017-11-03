; ODD OR EVEN     
	 PRESERVE8     
	 THUMB
     AREA     appcode1, CODE, READONLY
;     EXPORT __main
	 ENTRY 
;__main  FUNCTION
	
	MOV R0,#36
	MOV R2, #2
	UDIV R1,R0,R2
	MLS R1,R1,R2,R0 ; finding remainder of division using MLS(Multiply and Subtract instruction)
	CMP R1,#1
	ITE EQ
	MOVEQ R2,#1;ODD
	MOVNE R2,#0;EVEN
	
stop B stop ; stop program
;   ENDFUNC
     END