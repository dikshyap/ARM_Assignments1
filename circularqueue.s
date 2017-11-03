; IMPLEMENTATION OF CIRCULAR QUEUE
   PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
		
        MOV r0, #-1 ; front(r0)
		MOV r1, #-1 ; rear(r1)
		MOV r2, #10 ; size(r2)
		MOV r6, #0x20000000; starting memory location
		MOV r4, #10; data 
		SUB r5, r6, #4 ; Initial Front address
		SUB r3, r6, #4 ; Initial Rear address
		MOV r11, #0; set memory location which is freeing up to "0" while dequeue operation
		MOV r8, r2
enqueue
	CMP r8,#0; checking full condition
	BEQ dequeue
	SUB r10, r0, #1 
	CMP r1, r10; checking if rear equals front-1
	BEQ full
	CMP r0, #0
	BNE notfull
	SUB r10, r2, #1;checking if front is 0 and rear equals size-1
	CMP r1, r10
	BEQ full
notfull
    CMP r1, #-1 
	CMP r0, #-1
	MOVEQ r0, #0
	MOVEQ r1, #0
	MOVEQ r5, r6
	MOVEQ r3, r6
	BEQ store
	CMP r0, #0
	BEQ elsecase
	SUB r10, r2, #1
	CMP r1, r10
	MOVEQ r1, #0
	MOVEQ r3, r6
	BEQ store
	BNE elsecase
full 
    B dequeue;
elsecase
	ADD r1, r1, #1
	ADD r3, r3, #4
store
	STR r4, [r3]
	ADD r4, r4, #10; generating random data using ADD instead of EOR for simplicity
	SUB r8, r8, #1
	B enqueue
dequeue
	CMP r8, r2  
	BEQ stop
	CMP r0, #-1; if front=-1,circular queue is empty
	BEQ empty
	CMP r0, r1;checking if front equals rear, if yes then set front=-1 and rear=-1
	MOVEQ r1, #-1
	MOVEQ r0, #-1
	SUBEQ r3, r6, #4
	SUBEQ r5, r6, #4
	BEQ remove
	SUB r10, r2, #-1;checking if front equals size-1
	CMP r0, r10
	MOVEQ r0, #0
	MOVEQ r5, r6
	BEQ remove
	LDR r9,[r5]
	STR r11,[r5]
	ADD r0, r0, #1;front++
	ADD r5, r5, #4
remove
    LDR r9, [r5]
	STR r11,[r5]
	ADD r8, r8, #1
	B dequeue
empty
	B stop
stop B stop ; stop program
     ENDFUNC
     END
		 