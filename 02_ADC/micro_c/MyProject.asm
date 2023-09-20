
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,5 :: 		ANSELA=0X01;
	MOVLW       1
	MOVWF       ANSELA+0 
;MyProject.c,6 :: 		ANSELD=0;
	CLRF        ANSELD+0 
;MyProject.c,7 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;MyProject.c,8 :: 		TRISA=1;
	MOVLW       1
	MOVWF       TRISA+0 
;MyProject.c,9 :: 		TRISD=0;
	CLRF        TRISD+0 
;MyProject.c,10 :: 		TRISC=0;
	CLRF        TRISC+0 
;MyProject.c,11 :: 		DELAY_1SEC();
	CALL        _Delay_1sec+0, 0
;MyProject.c,12 :: 		DELAY_1SEC();
	CALL        _Delay_1sec+0, 0
;MyProject.c,14 :: 		while(1){
L_main0:
;MyProject.c,15 :: 		variable=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _variable+0 
	MOVF        R1, 0 
	MOVWF       _variable+1 
;MyProject.c,16 :: 		LATC=variable;
	MOVF        R0, 0 
	MOVWF       LATC+0 
;MyProject.c,17 :: 		LATD=Hi(variable);
	MOVF        _variable+1, 0 
	MOVWF       LATD+0 
;MyProject.c,18 :: 		}
	GOTO        L_main0
;MyProject.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
