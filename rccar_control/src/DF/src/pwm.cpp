#include "DF/pwm.h"

pwm::pwm(jetsonXavierGPIONumber pinNum)
{
	std::cout << "Testing the GPIO Pins" << std::endl;

	jetsonXavierGPIONumber pin = pinNum;
	//pin = gpio424; 
	this->pin = pin;
	gpioUnexport(pin);
	gpioExport(pin);
	gpioSetDirection(pin,outputPin);
	per = 0;
	std::thread m_thread(&pwm::run, this);
	m_thread.join();
}

void pwm::run()
{
	while(1)
	{
		gpioSetValue(pin, on);
		usleep(per*10);
	
		gpioSetValue(pin, off);
		usleep(1000 - (per*10));
	}
}

pwm::~pwm()
{
	std::cout << "GPIO example finished." << std::endl;
	gpioUnexport(pin);
}

void pwm::dutySet(int per)
{
	this->per = per;
}


