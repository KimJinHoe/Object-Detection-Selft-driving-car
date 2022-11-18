#ifndef __NODELET_DMF__
#define __NODELET_DMF__

#include <ros/ros.h>
#include "DMF/MsgSpeed.h"
#include "DMF/Speed.h"
#include "DMF/MsgLine.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"
#include "LF/MsgDetect.h"
#include <stdlib.h>


namespace nodelet_sample
{

class Nodelet_DMF
{
private:
	ros::Publisher pub_speed;
	std::string param;
	ros::Timer timer;
        ros::Subscriber sub_angel;
        ros::Subscriber sub_speed;
	ros::Subscriber sub_detect;
	ros::NodeHandle n_;
	
	DMF::MsgSpeed MsgSpeed;
	
	void msgcallback_speed(const DMF::Speed::ConstPtr &msg);
	//void msgcallback_angle(const std_msgs::String::ConstPtr& msg);
	void msgcallback_angle(const std_msgs::Float64::ConstPtr& msg);
	void msgCallback_detect(const LF::MsgDetect::ConstPtr &msg);
public:
	Nodelet_DMF();
        ~Nodelet_DMF();
	
  	void init(ros::NodeHandle &nh, ros::NodeHandle &private_nh);
	
	
}; // class NodeletSample

}; // namespace nodelet_sample
#endif

