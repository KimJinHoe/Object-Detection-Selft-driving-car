#include "jetsonGPIO.h"
#include <iostream>
#include <thread>
#include <time.h>
#include <unistd.h>
#include <errno.h>

class pwm
{
	public:
		pwm(jetsonXavierGPIONumber pinNum);
		~pwm();
		void dutySet(int per);
	private:
		void run();
		jetsonXavierGPIONumber pin;
		int per;
};
