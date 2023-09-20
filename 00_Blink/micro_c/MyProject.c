void main() {
TRISD=0;
while(1){
PORTD=0x0F;
DELAY_MS(1000);
PORTD=0x00;
DELAY_MS(1000);
}
}