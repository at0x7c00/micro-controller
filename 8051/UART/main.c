
#include "reg51.h"			 
#include "lcd.h"
typedef unsigned int u16;	  
typedef unsigned char u8;


void sendData(u8 d){
	TMOD = 0x20;
	TH1 = 0xF3;
	PCON=0X80;
	SCON = 0x50;

	TR1 = 1;

	SBUF = d;
	while(!TI);

	TI = 0;

}


u8 receiveData(){
    u8 d;
	TMOD = 0x20;
	TH1 = 0xF3;
	PCON=0X80;
	SCON = 0x50;

	TR1 = 1;

	while(!RI);

	d = SBUF;
	P2 = d;
	RI = 0;
	return d;
}

void main(){	
   char d;
   P2 = 0x00;
   LcdInit();
   LcdInit();
   while(1){
		d = receiveData();
		P2 = d;
		LcdWriteData(d);
		sendData(d);
   }
   		
}


