#include <built_in.h>
unsigned int variable;
void main() {

 ANSELA=0X01;
 ANSELD=0;
 ANSELC=0;
 TRISA=1;
 TRISD=0;
 TRISC=0;
 DELAY_1SEC();
 DELAY_1SEC();

 while(1){
 variable=ADC_Read(0);
 LATC=variable;
 LATD=Hi(variable);
 }

}