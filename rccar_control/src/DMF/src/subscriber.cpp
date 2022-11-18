#include "ros/ros.h"
#include "std_msgs/String.h"
#include "communication_interface/test.h"
#include "DMF/MsgSpeed.h"
#include "DMF/Nodelet_DMF.h"

using namespace nodelet_sample;
/*
void Callback_func(const std_msgs::String::ConstPtr& msg)
{
	ROS_INFO("get : %s", msg->data.c_str());
}
*/

int main(int argc, char **argv)
{
	ros::init(argc, argv, "sub_nude");
        ros::NodeHandle nh;
        ros::NodeHandle private_nh("~");

        Nodelet_DMF ns;
        ns.init(nh, private_nh);

	ros::spin();

	return 0;
}

/*
void msgcallback_speed(const DMF::MsgSpeed::ConstPtr &msg)
{

    ROS_INFO("speed : %d", msg->speed);
}
*/
/*
void Callback_func(const std_msgs::String::ConstPtr& msg)
{

	ROS_INFO("get : %s", msg->data.c_str());

	MsgSpeed.angle = atoi(msg->c_str);
	pub_speed.publish(MsgSpeed);
	ROS_INFO("angle : %d", msg->num);
}

int main(int argc, char **argv)
{
        ros::init(argc, argv, "sub_nude");


        ros::NodeHandle n;
        ros::Subscriber sub_angel = n.subscribe("angle", 100, Callback_func);
//        ros::Subscriber sub_speed = n.subscribe("speed", 10, msgcallback);
        ros::spin();

        return 0;
}
*/
