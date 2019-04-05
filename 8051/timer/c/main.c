#include<reg52.h>
void delay(unsigned int ms);
void main(void){
	while(1){
		P1 = 0x55;
		delay(1000);
		P1 = 0xAA;
		delay(1000);
	}
}

void delay(unsigned int ms){
	while(ms--){
	//设定定时器模式
	TMOD = 0x01;
	//设定计数次数
	TH0 = 0xFC;
	TL0 = 0x39;
	//开启定时器
	TR0 = 1;
	while(TF0 == 0){}
	//停止定时器
	TR0 = 0;
	//情况定时器标志
	TF0 = 0;
	}
}
