#include "ros/ros.h"
#include "DMF/MsgnCurLane.h"

int main(int argc, char **argv)
{
ros::init(argc, argv, "nCurLane_publisher");
ros::NodeHandle nh; 
ros::Publisher tutorial_pub = nh.advertise<DMF::MsgnCurLane>("MsgnCurLane", 100);

ros::Rate loop_rate(1);

DMF::MsgnCurLane msg;

int count = 0;
while (ros::ok())
{
msg.nCurLane = count;
ROS_INFO("send msg = %d", msg.nCurLane);
tutorial_pub.publish(msg);
loop_rate.sleep();
count = count + 2;
}
return 0;
}

