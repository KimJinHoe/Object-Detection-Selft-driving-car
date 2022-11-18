#include "DMF/Nodelet_DMF.h"
#include "DMF/MsgSpeed.h"
#include "communication_interface/test.h"
#include <sstream>


namespace nodelet_sample
{

Nodelet_DMF::Nodelet_DMF()
{
    pub_speed = n_.advertise<DMF::MsgSpeed>("data_speed", 100);
}

Nodelet_DMF::~Nodelet_DMF()
{
}

void Nodelet_DMF::init(ros::NodeHandle &nh, ros::NodeHandle &private_nh)
{

        sub_angel = nh.subscribe("angle", 100, &Nodelet_DMF::msgcallback_angle, this);
        sub_speed = nh.subscribe("Speed", 100, &Nodelet_DMF::msgcallback_speed, this);
	//sub_detect= nh.subscribe("data_detect", 100, &Nodelet_DMF::msgCallback_detect, this);

}
/*
void Nodelet_DMF::msgCallback_detect(const LF::MsgDetect::ConstPtr &msg)
{
    MsgSpeed.detect = msg->detect;
    //ROS_INFO("dtect : %d", MsgSpeed.detect);
}
*/
void Nodelet_DMF::msgcallback_speed(const DMF::Speed::ConstPtr &msg)
{
        MsgSpeed.speed = msg->speed;
	MsgSpeed.detect = msg->detect;
        //pub_speed.publish(MsgSpeed);
        ROS_INFO("detect %d speed : %d", MsgSpeed.detect, MsgSpeed.speed);
}

void Nodelet_DMF::msgcallback_angle(const std_msgs::Float64::ConstPtr& msg)
{
	
	//ROS_INFO("data: %f", msg->data);
	MsgSpeed.angle = msg->data;
//    ROS_INFO("data: %s", msg->data.c_str());
//    std::stringstream sslnt(msg->data.c_str());
//    sslnt >> MsgSpeed.angle;
//    ROS_INFO("data: %s", MsgSpeed;
      pub_speed.publish(MsgSpeed);
//    pub_speed.publish();
	
}

}//namespace nodelet_sample




