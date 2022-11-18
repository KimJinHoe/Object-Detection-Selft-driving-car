#include "DMF/speed.h"

int main(int argc, char **argv)
{	
	ros::init(argc, argv, "speed_pub");
        speed speed;
	
	speed.subscribeMsg();
        ros::spin();


	return 0;
}

