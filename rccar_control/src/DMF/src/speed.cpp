#include "DMF/speed.h"

speed::speed()
{
    speed_data = n_.advertise<DMF::Speed>("Speed", 100);
    detect_buf = 0;
    a = -20000;
}

speed::~speed()
{
}

void speed::msgCallback_detect(const LF::MsgDetect::ConstPtr &msg)
{
    detect_ = msg->detect;
    Speed.detect = msg->detect;
    if(detect_ == 1)
    {
        a = 0;
	detect_buf = 1;
    }
    else if(detect_ == 5)
    {
        a = 0;
	detect_buf = 1;
    }
    else
    {
	    if(detect_ == 2)
	    {
		a = -36000;
	    }
	    else if(detect_ == 3)
	    {
		//a = -20000;
		a = 0;
		detect_buf = 1;
	    }
            
	    if(detect_buf == 1)
	    {
		a = -20000;
		detect_buf = 0;
	    }
    }
    Speed.speed = a;
    speed_data.publish(Speed);
    ROS_INFO("detect : %d speed : %d",Speed.detect ,Speed.speed);
}

void speed::subscribeMsg()
{
	sub_detect= nh.subscribe("data_detect", 100, &speed::msgCallback_detect, this);
}

