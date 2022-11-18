#ifndef __SPEED__
#define __SPEED__

#include <ros/ros.h>
#include "DMF/Speed.h"
#include "LF/MsgDetect.h"
#include <stdlib.h>

class speed
{
private:
	ros::Publisher speed_data;
	std::string param;
	ros::Timer timer;
	ros::Subscriber sub_detect;
	ros::NodeHandle n_;
	ros::NodeHandle nh;
	
	DMF::Speed Speed;
	LF::MsgDetect Detect;
	int a;
	int detect_buf;
	void msgCallback_detect(const LF::MsgDetect::ConstPtr &msg);
public:
	speed();
        ~speed();
	void subscribeMsg();
	int detect_;
	
	
}; // class speed


#endif
