
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		TRISD=0;
	CLRF        TRISD+0 
;MyProject.c,3 :: 		while(1){
L_main0:
;MyProject.c,4 :: 		PORTD=0x0F;
	MOVLW       15
	MOVWF       PORTD+0 
;MyProject.c,5 :: 		DELAY_MS(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;MyProject.c,6 :: 		PORTD=0x00;
	CLRF        PORTD+0 
;MyProject.c,7 :: 		DELAY_MS(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;MyProject.c,8 :: 		}
	GOTO        L_main0
;MyProject.c,9 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
