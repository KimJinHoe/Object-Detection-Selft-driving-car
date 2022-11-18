#include "ros/ros.h" // ROS ±âº» Çì´õÆÄÀÏ
#include "communication_interface/test.h"
#include "communication_interface/test2.h"
#include "LF/MsgGPS.h"

void msgCallback1(const LF::MsgGPS::ConstPtr& msg)
{
    ROS_INFO("lati : %lf longi : %lf", msg->lati, msg->longi);
}

void msgCallback2(const communication_interface::test2::ConstPtr& msg)
{
ROS_INFO("recieve msg = %d", msg->data);
}
int main(int argc, char **argv)
{
ros::init(argc, argv, "topic_subscriber");
ros::NodeHandle nh;

ros::Subscriber ros_tutorial_sub = nh.subscribe("GPS", 100, msgCallback1);
//ros::Subscriber ros_tutorial_sub = nh.subscribe("speed_data", 100, msgCallback2);
ros::spin();
return 0;
}

