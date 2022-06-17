#line 1 "C:/Documents and Settings/061040326/Meus documentos/davi/tcc/tccUTF.c"








char dado_recebido;
unsigned int sensor1, sensor2, sensor3;

void envia_estado(){
 Usart_Write( PORTB.F7 );
 Usart_Write( PORTB.F6 );
 Usart_Write(sensor1);

 Usart_Write( PORTB.F5 );
 Usart_Write( PORTB.F4 );
 Usart_Write( PORTB.F3 );
 Usart_Write( PORTB.F2 );

 Usart_Write(sensor2);

 }

void liga (){
 while (!Usart_Data_Ready());
 dado_recebido = Usart_Read();
 switch(dado_recebido){
 case 'A':  PORTB.F7 =1; break;
 case 'B':  PORTB.F6 =1; break;
 case 'C':  PORTB.F5 =1; break;
 case 'D':  PORTB.F4 =1; break;
 case 'E':  PORTB.F3 =1; break;
 case 'F':  PORTB.F2 =1; break;
 }
}

void desliga (){
 while (!Usart_Data_Ready());
 dado_recebido = Usart_Read();
 switch(dado_recebido){
 case 'A':  PORTB.F7 =0; break;
 case 'B':  PORTB.F6 =0; break;
 case 'C':  PORTB.F5 =0; break;
 case 'D':  PORTB.F4 =0; break;
 case 'E':  PORTB.F3 =0; break;
 case 'F':  PORTB.F2 =0; break;
 }
}


void main(){
 Usart_Init(9600);
 PORTB = 0x00;
 PORTD = 0x00;
 TRISA = 0xFF;
 TRISB = 0x00;
 TRISD = 0x00;
 ADCON1= 0b00000010;



 do{
  PORTD.F1  = 1;

 if (Usart_Data_Ready()){
 dado_recebido = Usart_Read();
 Usart_Write(dado_recebido);
 switch (dado_recebido) {
 case '1' : liga(); break;
 case '0' : desliga(); break;
 }

 }

 sensor1 = Adc_Read(0);
 sensor2 = Adc_Read(1);
 sensor3 = Adc_Read(2);
 envia_estado();
 Delay_ms(500);
 } while(1);

}
