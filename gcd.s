; GCD OF 2 NUMBERS     
	 PRESERVE8     
	 THUMB
     AREA     appcode1, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	
	  MOV R0,#15
	  MOV R1,#20
start CMP R0,R1
	  BEQ stop
	  ITE GT
	  SUBGT R0,R0,R1
	  SUBLE R1,R1,R0
	  B start ; check GCD in R0 or R1
	
stop B stop ; stop program
     ENDFUNC
     END