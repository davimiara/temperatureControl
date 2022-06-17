;  ASM code generated by mikroVirtualMachine for PIC - V. 8.1.0.0
;  Date/Time: 6/11/2009 15:40:57
;  Info: http://www.mikroe.com


; ADDRESS	OPCODE	ASM
; ----------------------------------------------
$0000	$2804			GOTO	_main
$0147	$	_Usart_Data_Ready:
$0147	$3000			MOVLW	0
$0148	$1303			BCF	STATUS, RP1
$0149	$1283			BCF	STATUS, RP0
$014A	$1A8C			BTFSC	PIR1, 5
$014B	$3001			MOVLW	1
$014C	$00F1			MOVWF	STACK_1
$014D	$0871			MOVF	STACK_1, 0
$014E	$00F0			MOVWF	STACK_0
$014F	$0008			RETURN
$013C	$	_Usart_Read:
$013C	$1303			BCF	STATUS, RP1
$013D	$1283			BCF	STATUS, RP0
$013E	$081A			MOVF	RCREG, 0
$013F	$00AC			MOVWF	Usart_Read_tmp_L0
$0140	$1C98			BTFSS	RCSTA, 1
$0141	$2944			GOTO	L_Usart_Read_2
$0142	$1218			BCF	RCSTA, 4
$0143	$1618			BSF	RCSTA, 4
$0144	$	L_Usart_Read_2:
$0144	$082C			MOVF	Usart_Read_tmp_L0, 0
$0145	$00F0			MOVWF	STACK_0
$0146	$0008			RETURN
$0150	$	_Delay_22us:
;delays.c,15 :: 		void Delay_22us() {
;delays.c,16 :: 		Delay_us(22);
$0150	$3007			MOVLW	7
$0151	$1303			BCF	STATUS, RP1
$0152	$1283			BCF	STATUS, RP0
$0153	$00FA			MOVWF	STACK_10
$0154	$0BFA			DECFSZ	STACK_10, F
$0155	$2954			GOTO	$-1
;delays.c,17 :: 		}
$0156	$0008			RETURN
$011C	$	_Usart_Write:
$011C	$	L_Usart_Write_3:
$011C	$3000			MOVLW	0
$011D	$1303			BCF	STATUS, RP1
$011E	$1683			BSF	STATUS, RP0
$011F	$1898			BTFSC	TXSTA, 1
$0120	$3001			MOVLW	1
$0121	$00F1			MOVWF	STACK_1
$0122	$0871			MOVF	STACK_1, 0
$0123	$3A00			XORLW	0
$0124	$1D03			BTFSS	STATUS, Z
$0125	$2928			GOTO	L_Usart_Write_4
$0126	$0000			NOP
$0127	$291C			GOTO	L_Usart_Write_3
$0128	$	L_Usart_Write_4:
$0128	$1283			BCF	STATUS, RP0
$0129	$082C			MOVF	FARG_Usart_Write+0, 0
$012A	$0099			MOVWF	TXREG
$012B	$0008			RETURN
$00C5	$	_liga:
;tccUTF.c,26 :: 		void liga (){
;tccUTF.c,27 :: 		while (!Usart_Data_Ready());
$00C5	$	L_liga_0:
$00C5	$2147			CALL	_Usart_Data_Ready
$00C6	$0870			MOVF	STACK_0, 0
$00C7	$1903			BTFSC	STATUS, Z
$00C8	$28C5			GOTO	L_liga_0
$00C9	$	L_liga_1:
;tccUTF.c,28 :: 		dado_recebido = Usart_Read();
$00C9	$213C			CALL	_Usart_Read
$00CA	$0870			MOVF	STACK_0, 0
$00CB	$00A0			MOVWF	_dado_recebido
;tccUTF.c,29 :: 		switch(dado_recebido){
$00CC	$28D9			GOTO	L_liga_2
;tccUTF.c,30 :: 		case 'A': rele1a=1; break;
$00CD	$	L_liga_4:
$00CD	$1786			BSF	PORTB, 7
$00CE	$28F1			GOTO	L_liga_3
;tccUTF.c,31 :: 		case 'B': rele1b=1; break;
$00CF	$	L_liga_5:
$00CF	$1706			BSF	PORTB, 6
$00D0	$28F1			GOTO	L_liga_3
;tccUTF.c,32 :: 		case 'C': rele2a=1; break;
$00D1	$	L_liga_6:
$00D1	$1686			BSF	PORTB, 5
$00D2	$28F1			GOTO	L_liga_3
;tccUTF.c,33 :: 		case 'D': rele2b=1; break;
$00D3	$	L_liga_7:
$00D3	$1606			BSF	PORTB, 4
$00D4	$28F1			GOTO	L_liga_3
;tccUTF.c,34 :: 		case 'E': rele3=1;  break;
$00D5	$	L_liga_8:
$00D5	$1586			BSF	PORTB, 3
$00D6	$28F1			GOTO	L_liga_3
;tccUTF.c,35 :: 		case 'F': rele4=1;  break;
$00D7	$	L_liga_9:
$00D7	$1506			BSF	PORTB, 2
$00D8	$28F1			GOTO	L_liga_3
;tccUTF.c,36 :: 		}
$00D9	$	L_liga_2:
$00D9	$0820			MOVF	_dado_recebido, 0
$00DA	$3A41			XORLW	65
$00DB	$1903			BTFSC	STATUS, Z
$00DC	$28CD			GOTO	L_liga_4
$00DD	$0820			MOVF	_dado_recebido, 0
$00DE	$3A42			XORLW	66
$00DF	$1903			BTFSC	STATUS, Z
$00E0	$28CF			GOTO	L_liga_5
$00E1	$0820			MOVF	_dado_recebido, 0
$00E2	$3A43			XORLW	67
$00E3	$1903			BTFSC	STATUS, Z
$00E4	$28D1			GOTO	L_liga_6
$00E5	$0820			MOVF	_dado_recebido, 0
$00E6	$3A44			XORLW	68
$00E7	$1903			BTFSC	STATUS, Z
$00E8	$28D3			GOTO	L_liga_7
$00E9	$0820			MOVF	_dado_recebido, 0
$00EA	$3A45			XORLW	69
$00EB	$1903			BTFSC	STATUS, Z
$00EC	$28D5			GOTO	L_liga_8
$00ED	$0820			MOVF	_dado_recebido, 0
$00EE	$3A46			XORLW	70
$00EF	$1903			BTFSC	STATUS, Z
$00F0	$28D7			GOTO	L_liga_9
$00F1	$	L_liga_3:
;tccUTF.c,37 :: 		}
$00F1	$0008			RETURN
$0098	$	_desliga:
;tccUTF.c,39 :: 		void desliga (){
;tccUTF.c,40 :: 		while (!Usart_Data_Ready());
$0098	$	L_desliga_10:
$0098	$2147			CALL	_Usart_Data_Ready
$0099	$0870			MOVF	STACK_0, 0
$009A	$1903			BTFSC	STATUS, Z
$009B	$2898			GOTO	L_desliga_10
$009C	$	L_desliga_11:
;tccUTF.c,41 :: 		dado_recebido = Usart_Read();
$009C	$213C			CALL	_Usart_Read
$009D	$0870			MOVF	STACK_0, 0
$009E	$00A0			MOVWF	_dado_recebido
;tccUTF.c,42 :: 		switch(dado_recebido){
$009F	$28AC			GOTO	L_desliga_12
;tccUTF.c,43 :: 		case 'A': rele1a=0; break;
$00A0	$	L_desliga_14:
$00A0	$1386			BCF	PORTB, 7
$00A1	$28C4			GOTO	L_desliga_13
;tccUTF.c,44 :: 		case 'B': rele1b=0; break;
$00A2	$	L_desliga_15:
$00A2	$1306			BCF	PORTB, 6
$00A3	$28C4			GOTO	L_desliga_13
;tccUTF.c,45 :: 		case 'C': rele2a=0; break;
$00A4	$	L_desliga_16:
$00A4	$1286			BCF	PORTB, 5
$00A5	$28C4			GOTO	L_desliga_13
;tccUTF.c,46 :: 		case 'D': rele2b=0; break;
$00A6	$	L_desliga_17:
$00A6	$1206			BCF	PORTB, 4
$00A7	$28C4			GOTO	L_desliga_13
;tccUTF.c,47 :: 		case 'E': rele3=0;  break;
$00A8	$	L_desliga_18:
$00A8	$1186			BCF	PORTB, 3
$00A9	$28C4			GOTO	L_desliga_13
;tccUTF.c,48 :: 		case 'F': rele4=0;  break;
$00AA	$	L_desliga_19:
$00AA	$1106			BCF	PORTB, 2
$00AB	$28C4			GOTO	L_desliga_13
;tccUTF.c,49 :: 		}
$00AC	$	L_desliga_12:
$00AC	$0820			MOVF	_dado_recebido, 0
$00AD	$3A41			XORLW	65
$00AE	$1903			BTFSC	STATUS, Z
$00AF	$28A0			GOTO	L_desliga_14
$00B0	$0820			MOVF	_dado_recebido, 0
$00B1	$3A42			XORLW	66
$00B2	$1903			BTFSC	STATUS, Z
$00B3	$28A2			GOTO	L_desliga_15
$00B4	$0820			MOVF	_dado_recebido, 0
$00B5	$3A43			XORLW	67
$00B6	$1903			BTFSC	STATUS, Z
$00B7	$28A4			GOTO	L_desliga_16
$00B8	$0820			MOVF	_dado_recebido, 0
$00B9	$3A44			XORLW	68
$00BA	$1903			BTFSC	STATUS, Z
$00BB	$28A6			GOTO	L_desliga_17
$00BC	$0820			MOVF	_dado_recebido, 0
$00BD	$3A45			XORLW	69
$00BE	$1903			BTFSC	STATUS, Z
$00BF	$28A8			GOTO	L_desliga_18
$00C0	$0820			MOVF	_dado_recebido, 0
$00C1	$3A46			XORLW	70
$00C2	$1903			BTFSC	STATUS, Z
$00C3	$28AA			GOTO	L_desliga_19
$00C4	$	L_desliga_13:
;tccUTF.c,50 :: 		}
$00C4	$0008			RETURN
$00F2	$	_Adc_Read:
$00F2	$30C0			MOVLW	192
$00F3	$1303			BCF	STATUS, RP1
$00F4	$1283			BCF	STATUS, RP0
$00F5	$009F			MOVWF	ADCON0
$00F6	$0827			MOVF	FARG_Adc_Read+0, 0
$00F7	$00F0			MOVWF	STACK_0
$00F8	$0DF0			RLF	STACK_0, 1
$00F9	$1070			BCF	STACK_0, 0
$00FA	$0DF0			RLF	STACK_0, 1
$00FB	$1070			BCF	STACK_0, 0
$00FC	$0870			MOVF	STACK_0, 0
$00FD	$049F			IORWF	ADCON0, 1
$00FE	$1683			BSF	STATUS, RP0
$00FF	$179F			BSF	ADCON1, 7
$0100	$1283			BCF	STATUS, RP0
$0101	$141F			BSF	ADCON0, 0
$0102	$2150			CALL	_Delay_22us
$0103	$149F			BSF	ADCON0, 1
$0104	$	L_Adc_Read_0:
$0104	$1C9F			BTFSS	ADCON0, 1
$0105	$2908			GOTO	L_Adc_Read_1
$0106	$0000			NOP
$0107	$2904			GOTO	L_Adc_Read_0
$0108	$	L_Adc_Read_1:
$0108	$101F			BCF	ADCON0, 0
$0109	$3008			MOVLW	8
$010A	$00F2			MOVWF	STACK_2
$010B	$081E			MOVF	ADRESH, 0
$010C	$00F0			MOVWF	STACK_0
$010D	$01F1			CLRF	STACK_0+1
$010E	$0872			MOVF	STACK_2, 0
$010F	$	L_Adc_Read_2:
$010F	$1903			BTFSC	STATUS, Z
$0110	$2916			GOTO	L_Adc_Read_3
$0111	$0DF0			RLF	STACK_0, 1
$0112	$0DF1			RLF	STACK_0+1, 1
$0113	$1070			BCF	STACK_0, 0
$0114	$3FFF			ADDLW	255
$0115	$290F			GOTO	L_Adc_Read_2
$0116	$	L_Adc_Read_3:
$0116	$1683			BSF	STATUS, RP0
$0117	$081E			MOVF	ADRESL, 0
$0118	$04F0			IORWF	STACK_0, 1
$0119	$3000			MOVLW	0
$011A	$04F1			IORWF	STACK_0+1, 1
$011B	$0008			RETURN
$0065	$	_envia_estado:
;tccUTF.c,12 :: 		void envia_estado(){
;tccUTF.c,13 :: 		Usart_Write(rele1a);
$0065	$3000			MOVLW	0
$0066	$1303			BCF	STATUS, RP1
$0067	$1283			BCF	STATUS, RP0
$0068	$1B86			BTFSC	PORTB, 7
$0069	$3001			MOVLW	1
$006A	$00F1			MOVWF	STACK_1
$006B	$0871			MOVF	STACK_1, 0
$006C	$00AC			MOVWF	FARG_Usart_Write+0
$006D	$211C			CALL	_Usart_Write
;tccUTF.c,14 :: 		Usart_Write(rele1b);
$006E	$3000			MOVLW	0
$006F	$1B06			BTFSC	PORTB, 6
$0070	$3001			MOVLW	1
$0071	$00F1			MOVWF	STACK_1
$0072	$0871			MOVF	STACK_1, 0
$0073	$00AC			MOVWF	FARG_Usart_Write+0
$0074	$211C			CALL	_Usart_Write
;tccUTF.c,15 :: 		Usart_Write(sensor1);
$0075	$0821			MOVF	_sensor1, 0
$0076	$00AC			MOVWF	FARG_Usart_Write+0
$0077	$211C			CALL	_Usart_Write
;tccUTF.c,17 :: 		Usart_Write(rele2a);
$0078	$3000			MOVLW	0
$0079	$1A86			BTFSC	PORTB, 5
$007A	$3001			MOVLW	1
$007B	$00F1			MOVWF	STACK_1
$007C	$0871			MOVF	STACK_1, 0
$007D	$00AC			MOVWF	FARG_Usart_Write+0
$007E	$211C			CALL	_Usart_Write
;tccUTF.c,18 :: 		Usart_Write(rele2b);
$007F	$3000			MOVLW	0
$0080	$1A06			BTFSC	PORTB, 4
$0081	$3001			MOVLW	1
$0082	$00F1			MOVWF	STACK_1
$0083	$0871			MOVF	STACK_1, 0
$0084	$00AC			MOVWF	FARG_Usart_Write+0
$0085	$211C			CALL	_Usart_Write
;tccUTF.c,19 :: 		Usart_Write(rele3);
$0086	$3000			MOVLW	0
$0087	$1986			BTFSC	PORTB, 3
$0088	$3001			MOVLW	1
$0089	$00F1			MOVWF	STACK_1
$008A	$0871			MOVF	STACK_1, 0
$008B	$00AC			MOVWF	FARG_Usart_Write+0
$008C	$211C			CALL	_Usart_Write
;tccUTF.c,20 :: 		Usart_Write(rele4);
$008D	$3000			MOVLW	0
$008E	$1906			BTFSC	PORTB, 2
$008F	$3001			MOVLW	1
$0090	$00F1			MOVWF	STACK_1
$0091	$0871			MOVF	STACK_1, 0
$0092	$00AC			MOVWF	FARG_Usart_Write+0
$0093	$211C			CALL	_Usart_Write
;tccUTF.c,22 :: 		Usart_Write(sensor2);
$0094	$0823			MOVF	_sensor2, 0
$0095	$00AC			MOVWF	FARG_Usart_Write+0
$0096	$211C			CALL	_Usart_Write
;tccUTF.c,24 :: 		}
$0097	$0008			RETURN
$012C	$	_Usart_Init:
$012C	$1303			BCF	STATUS, RP1
$012D	$1683			BSF	STATUS, RP0
$012E	$1698			BSF	TXSTA, 5
$012F	$3090			MOVLW	144
$0130	$1283			BCF	STATUS, RP0
$0131	$0098			MOVWF	RCSTA
$0132	$1683			BSF	STATUS, RP0
$0133	$1787			BSF	TRISC, 7
$0134	$1307			BCF	TRISC, 6
$0135	$	L_Usart_Init_0:
$0135	$1283			BCF	STATUS, RP0
$0136	$1E8C			BTFSS	PIR1, 5
$0137	$293B			GOTO	L_Usart_Init_1
$0138	$081A			MOVF	RCREG, 0
$0139	$00AB			MOVWF	Usart_Init_tmp_L0
$013A	$2935			GOTO	L_Usart_Init_0
$013B	$	L_Usart_Init_1:
$013B	$0008			RETURN
$0004	$	_main:
;tccUTF.c,53 :: 		void main(){
;tccUTF.c,54 :: 		Usart_Init(9600);
$0004	$3019			MOVLW	25
$0005	$1303			BCF	STATUS, RP1
$0006	$1683			BSF	STATUS, RP0
$0007	$0099			MOVWF	SPBRG
$0008	$1518			BSF	TXSTA, BRGH
$0009	$212C			CALL	_Usart_Init
;tccUTF.c,55 :: 		PORTB = 0x00;
$000A	$0186			CLRF	PORTB, 1
;tccUTF.c,56 :: 		PORTD = 0x00;
$000B	$0188			CLRF	PORTD, 1
;tccUTF.c,57 :: 		TRISA = 0xFF;
$000C	$30FF			MOVLW	255
$000D	$1683			BSF	STATUS, RP0
$000E	$0085			MOVWF	TRISA
;tccUTF.c,58 :: 		TRISB = 0x00;
$000F	$0186			CLRF	TRISB, 1
;tccUTF.c,59 :: 		TRISD = 0x00;
$0010	$0188			CLRF	TRISD, 1
;tccUTF.c,60 :: 		ADCON1= 0b00000010;
$0011	$3002			MOVLW	2
$0012	$009F			MOVWF	ADCON1
;tccUTF.c,64 :: 		do{
$0013	$	L_main_20:
;tccUTF.c,65 :: 		standby = 1;
$0013	$1283			BCF	STATUS, RP0
$0014	$1488			BSF	PORTD, 1
;tccUTF.c,67 :: 		if (Usart_Data_Ready()){
$0015	$2147			CALL	_Usart_Data_Ready
$0016	$0870			MOVF	STACK_0, 0
$0017	$1903			BTFSC	STATUS, Z
$0018	$282C			GOTO	L_main_22
;tccUTF.c,68 :: 		dado_recebido = Usart_Read();
$0019	$213C			CALL	_Usart_Read
$001A	$0870			MOVF	STACK_0, 0
$001B	$00A0			MOVWF	_dado_recebido
;tccUTF.c,69 :: 		Usart_Write(dado_recebido);
$001C	$0870			MOVF	STACK_0, 0
$001D	$00AC			MOVWF	FARG_Usart_Write+0
$001E	$211C			CALL	_Usart_Write
;tccUTF.c,70 :: 		switch (dado_recebido) {
$001F	$2824			GOTO	L_main_23
;tccUTF.c,71 :: 		case '1' : liga(); break;
$0020	$	L_main_25:
$0020	$20C5			CALL	_liga
$0021	$282C			GOTO	L_main_24
;tccUTF.c,72 :: 		case '0' : desliga(); break;
$0022	$	L_main_26:
$0022	$2098			CALL	_desliga
$0023	$282C			GOTO	L_main_24
;tccUTF.c,73 :: 		}
$0024	$	L_main_23:
$0024	$0820			MOVF	_dado_recebido, 0
$0025	$3A31			XORLW	49
$0026	$1903			BTFSC	STATUS, Z
$0027	$2820			GOTO	L_main_25
$0028	$0820			MOVF	_dado_recebido, 0
$0029	$3A30			XORLW	48
$002A	$1903			BTFSC	STATUS, Z
$002B	$2822			GOTO	L_main_26
$002C	$	L_main_24:
;tccUTF.c,75 :: 		}
$002C	$	L_main_22:
;tccUTF.c,77 :: 		sensor1 = Adc_Read(0);
$002C	$01A7			CLRF	FARG_Adc_Read+0, 1
$002D	$20F2			CALL	_Adc_Read
$002E	$0870			MOVF	STACK_0, 0
$002F	$1283			BCF	STATUS, RP0
$0030	$00A1			MOVWF	_sensor1
$0031	$0871			MOVF	STACK_0+1, 0
$0032	$00A2			MOVWF	_sensor1+1
;tccUTF.c,78 :: 		sensor2 = Adc_Read(1);
$0033	$3001			MOVLW	1
$0034	$00A7			MOVWF	FARG_Adc_Read+0
$0035	$20F2			CALL	_Adc_Read
$0036	$0870			MOVF	STACK_0, 0
$0037	$1283			BCF	STATUS, RP0
$0038	$00A3			MOVWF	_sensor2
$0039	$0871			MOVF	STACK_0+1, 0
$003A	$00A4			MOVWF	_sensor2+1
;tccUTF.c,79 :: 		sensor3 = Adc_Read(2);
$003B	$3002			MOVLW	2
$003C	$00A7			MOVWF	FARG_Adc_Read+0
$003D	$20F2			CALL	_Adc_Read
$003E	$0870			MOVF	STACK_0, 0
$003F	$1283			BCF	STATUS, RP0
$0040	$00A5			MOVWF	_sensor3
$0041	$0871			MOVF	STACK_0+1, 0
$0042	$00A6			MOVWF	_sensor3+1
;tccUTF.c,80 :: 		envia_estado();
$0043	$2065			CALL	_envia_estado
;tccUTF.c,81 :: 		Delay_ms(500);
$0044	$3003			MOVLW	3
$0045	$00FC			MOVWF	STACK_12
$0046	$30FF			MOVLW	255
$0047	$00FB			MOVWF	STACK_11
$0048	$30FF			MOVLW	255
$0049	$00FA			MOVWF	STACK_10
$004A	$0BFC			DECFSZ	STACK_12, F
$004B	$284D			GOTO	$+2
$004C	$2854			GOTO	$+8
$004D	$0BFB			DECFSZ	STACK_11, F
$004E	$2850			GOTO	$+2
$004F	$2853			GOTO	$+4
$0050	$0BFA			DECFSZ	STACK_10, F
$0051	$2850			GOTO	$-1
$0052	$284D			GOTO	$-5
$0053	$284A			GOTO	$-9
$0054	$308C			MOVLW	140
$0055	$00FB			MOVWF	STACK_11
$0056	$30FF			MOVLW	255
$0057	$00FA			MOVWF	STACK_10
$0058	$0BFB			DECFSZ	STACK_11, F
$0059	$285B			GOTO	$+2
$005A	$285E			GOTO	$+4
$005B	$0BFA			DECFSZ	STACK_10, F
$005C	$285B			GOTO	$-1
$005D	$2858			GOTO	$-5
$005E	$30A1			MOVLW	161
$005F	$00FA			MOVWF	STACK_10
$0060	$0BFA			DECFSZ	STACK_10, F
$0061	$2860			GOTO	$-1
$0062	$0000			NOP
;tccUTF.c,82 :: 		} while(1);
$0063	$2813			GOTO	L_main_20
;tccUTF.c,84 :: 		}
$0064	$2864			GOTO	$