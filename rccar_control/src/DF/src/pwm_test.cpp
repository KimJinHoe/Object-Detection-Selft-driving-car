#include "DF/pwm.h"

int main()
{
	pwm pwm(gpio424);

	for(int i = 0; i < 100; i++)
	{
		pwm.dutySet(i);
		usleep(100000);
	}
	while(1)
	{

	}
	return 1;
}

