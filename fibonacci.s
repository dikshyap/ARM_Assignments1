; FIBONACCI SERIES   
	 PRESERVE8     
	 THUMB
     AREA     appcode1, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	
	  MOV R0,#7 ;n=7(for example) prints 0,1,1,2,3,5,8 ( displays in R4)
	  MOV R1,#0 ;a
	  MOV R2,#1 ;b
	  MOV R3,#2 ;i
	  MOV R4,#0 ;R4 holds fibonacci number series
	  MOV R4,#1
continue CMP R3,R0 ;while(i<n)
	     BEQ stop
	     ADD R4,R1,R2 ;c=a+b
	     MOV R1,R2    ;a=b
		 MOV R2,R4    ;b=c
		 ADD R3,R3,#1 ;i=i+1
		 B continue
	
stop B stop ; stop program
      ENDFUNC
     END