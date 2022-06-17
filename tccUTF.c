#define rele1a PORTB.F7
#define rele1b PORTB.F6
#define rele2a PORTB.F5
#define rele2b PORTB.F4
#define rele3 PORTB.F3
#define rele4 PORTB.F2
#define standby PORTD.F1

char dado_recebido;
unsigned int sensor1, sensor2, sensor3;

void envia_estado(){
     Usart_Write(rele1a);
     Usart_Write(rele1b);
     Usart_Write(sensor1);

     Usart_Write(rele2a);
     Usart_Write(rele2b);
     Usart_Write(rele3);
     Usart_Write(rele4);

     Usart_Write(sensor2);
     //Usart_Write(sensor3);
     }

void liga (){
          while (!Usart_Data_Ready());
          dado_recebido = Usart_Read();
          switch(dado_recebido){
                  case 'A': rele1a=1; break;
                  case 'B': rele1b=1; break;
                  case 'C': rele2a=1; break;
                  case 'D': rele2b=1; break;
                  case 'E': rele3=1;  break;
                  case 'F': rele4=1;  break;
          }
}

void desliga (){
           while (!Usart_Data_Ready());
           dado_recebido = Usart_Read();
           switch(dado_recebido){
                  case 'A': rele1a=0; break;
                  case 'B': rele1b=0; break;
                  case 'C': rele2a=0; break;
                  case 'D': rele2b=0; break;
                  case 'E': rele3=0;  break;
                  case 'F': rele4=0;  break;
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
      // Configurar os registradores iniciais, entrada,saida,config do adc
      //PCFG = 0010  (ADCON1)

   do{
     standby = 1;

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