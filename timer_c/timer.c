#include<reg52.h>

void ms_delay();

void main()
{
	
	TMOD=0X01;
	while(1)
	{
		P1=0XFF;
		ms_delay();
		P1=0X00;
		ms_delay();
	}
}

void ms_delay()
{
	TL0=0x00;
	TH0=0x0EE;
	TR0=1;
	while(!TF0);
	TR0=0;
	TF0=0;
}
