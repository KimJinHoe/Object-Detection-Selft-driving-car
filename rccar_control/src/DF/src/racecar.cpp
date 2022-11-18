#include "ros/ros.h"
#include "DF/MsgRF.h"
#include "DF/motor.h"

int main(int argc, char **argv)
{	
	ros::init(argc, argv, "racecar");
        motor motor(0, 3);


	motor.subscribeMsg();
        ros::spin();


	return 0;
/*
	motor motor(0);
	pwm pwm2(2);
	int input;
	pwm1.pwmSet(400);
	pwm2.pwmSet(307);
	while(1)
	{
		scanf("%d", &input);
		pwm1.pwmSet(input);
		pwm2.pwmSet(input);
	}
	sleep(1);
*/
}

