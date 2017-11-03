; LARGEST OF 3 NUMBERS
     PRESERVE8     
	 THUMB
     AREA     appcode1, CODE, READONLY
    EXPORT __main
	 ENTRY 
__main  FUNCTION
	
	MOV R0,#8 ;a
	MOV R1,#10 ;b
	MOV R2,#19 ;c
	MOV R5,#0
	CMP R0,R1
	CMPGT R0,R2  ;if((a>b)&&(a>c)) largest=a
	ITE GT
	MOVGT R3,R0  ; R3 stores the largest number
	MOVLE R5,#1
    CMP R5,#1	 
	BEQ next
stop B stop ; stop program
next CMP R1,R2     ;elseif(b>c)
     ITE GT 
	 MOVGT R3,R1  ;  largest=b
	 MOVLE R3,R2  ; else largest=c
	 B stop
	
	ENDFUNC
     END