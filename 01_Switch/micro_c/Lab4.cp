#line 1 "C:/Users/Pro/Desktop/empedd/MikroC-Lab4/Lab4.c"
#line 21 "C:/Users/Pro/Desktop/empedd/MikroC-Lab4/Lab4.c"
unsigned char oldstate;

void main() {
 ANSELA = 0;
 ANSELD = 0;
 TRISA0_bit = 1;

 TRISD = 0x00;
 LATD = 0b11110111;

 oldstate = 0;

 do {
 if (Button(&PORTA, 0, 1, 1)) {
 oldstate = 1;
 }
 if (oldstate && Button(&PORTA, 0, 1, 0)) {
 LATD = ~LATD;
 oldstate = 0;
 }
 } while(1);
}
