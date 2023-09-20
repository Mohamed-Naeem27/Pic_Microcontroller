#line 1 "C:/Users/Pro/Desktop/All_progict/progict_3/micro_c/MyProject.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 2 "C:/Users/Pro/Desktop/All_progict/progict_3/micro_c/MyProject.c"
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
 LATD= ((char *)&variable)[1] ;
 }

}
