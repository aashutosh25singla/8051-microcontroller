#include<reg52.h>

void ms_delay(unsigned int time);

void main()
{
	while(1)
	{
		P1=0x0ff;             //turn on the led
		ms_delay(1000);       //generate delay of 1 second
		P1=0x00;              //turn off the led
		ms_delay(1000);       //generate delay of 1 second
	}
}

void ms_delay(unsigned int time)
{
	unsigned int i,j;
	for(i=0;i<time;i++)
	{
		for(j=0;j<113;j++);     //generate delay of 1 micro second
	}
}