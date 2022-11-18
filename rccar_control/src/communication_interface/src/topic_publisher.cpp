#include "ros/ros.h"
#include "communication_interface/test2.h"

int main(int argc, char **argv)
{
ros::init(argc, argv, "GPS_publisher");
ros::NodeHandle nh;
ros::Publisher tutorial_pub = nh.advertise<communication_interface::test2>("GPS_data", 100);

ros::Rate loop_rate(1);

communication_interface::test2 msg;

int count = 0;
while (ros::ok())
{
msg.data = count;
ROS_INFO("send msg = %d", msg.data);
tutorial_pub.publish(msg);
loop_rate.sleep();
++count;
}
return 0;
}


