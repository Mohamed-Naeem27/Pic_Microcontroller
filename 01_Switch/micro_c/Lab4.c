

unsigned char oldstate;                          // Old state flag

void main() {
  ANSELA = 0;                                    // Configure PORTB pins as digital
  ANSELD = 0;                                    // Configure PORTC pins as digital
  TRISA0_bit = 1;                                // set RA0 pin as input

  TRISD = 0x00;                                  // Configure PORTC as output
  LATD = 0b11110111;                                   // Initial PORTC value

  oldstate = 0;

  do {
    if (Button(&PORTA, 0, 1, 1)) {               // Detect logical one
      oldstate = 1;                              // Update flag
    }
    if (oldstate && Button(&PORTA, 0, 1, 0)) {   // Detect one-to-zero transition
      LATD = ~LATD;                              // Invert PORTC
      oldstate = 0;                              // Update flag
    }
  } while(1);                                    // Endless loop
}