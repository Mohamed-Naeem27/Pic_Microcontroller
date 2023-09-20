
_main:

;Lab4.c,23 :: 		void main() {
;Lab4.c,24 :: 		ANSELA = 0;                                    // Configure PORTB pins as digital
	CLRF        ANSELA+0 
;Lab4.c,25 :: 		ANSELD = 0;                                    // Configure PORTC pins as digital
	CLRF        ANSELD+0 
;Lab4.c,26 :: 		TRISA0_bit = 1;                                // set RA0 pin as input
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;Lab4.c,28 :: 		TRISD = 0x00;                                  // Configure PORTC as output
	CLRF        TRISD+0 
;Lab4.c,29 :: 		LATD = 0b11110111;                                   // Initial PORTC value
	MOVLW       247
	MOVWF       LATD+0 
;Lab4.c,31 :: 		oldstate = 0;
	CLRF        _oldstate+0 
;Lab4.c,33 :: 		do {
L_main0:
;Lab4.c,34 :: 		if (Button(&PORTA, 0, 1, 1)) {               // Detect logical one
	MOVLW       PORTA+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;Lab4.c,35 :: 		oldstate = 1;                              // Update flag
	MOVLW       1
	MOVWF       _oldstate+0 
;Lab4.c,36 :: 		}
L_main3:
;Lab4.c,37 :: 		if (oldstate && Button(&PORTA, 0, 1, 0)) {   // Detect one-to-zero transition
	MOVF        _oldstate+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
	MOVLW       PORTA+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
L__main7:
;Lab4.c,38 :: 		LATD = ~LATD;                              // Invert PORTC
	COMF        LATD+0, 1 
;Lab4.c,39 :: 		oldstate = 0;                              // Update flag
	CLRF        _oldstate+0 
;Lab4.c,40 :: 		}
L_main6:
;Lab4.c,41 :: 		} while(1);                                    // Endless loop
	GOTO        L_main0
;Lab4.c,42 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
