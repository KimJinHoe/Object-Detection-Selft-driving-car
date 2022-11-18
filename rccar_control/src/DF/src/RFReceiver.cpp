#include "ros/ros.h"
#include "DF/MsgRF.h"
#include "DF/MsgMode.h"
#include "DF/rf.h"

int main(int argc, char **argv)
{
        rf rf;

        int axis_x;


        ros::init(argc, argv, "RFReceiver");
        ros::NodeHandle nh;
        ros::Publisher RFReceiver_Publisher = nh.advertise<DF::MsgRF>("msg_rf", 100);
        ros::Publisher Button_Publisher = nh.advertise<DF::MsgMode>("msg_mode", 100);

        ros::Rate loop_rate(10);

        DF::MsgRF msg;
        DF::MsgMode msg2;

        while(ros::ok())
        {
                msg.stamp = ros::Time::now();
                msg.axis_x = rf.get_axis(0,0);
                msg.axis_y = rf.get_axis(0,1);
                msg.axis_setMode = rf.get_axis(2,0);
                ROS_INFO("Time = %d.%d, Axis X = %d, Axis Y = %d, Set mode = %d", msg.stamp.sec, msg.stamp.nsec, msg.axis_x, msg.axis_y, msg.axis_setMode);
                RFReceiver_Publisher.publish(msg);
                msg2.modeA = rf.get_button(0);
                msg2.modeB = rf.get_button(1);
                Button_Publisher.publish(msg2);
                ROS_INFO("ButtonA : %d, ButtonB ; %d", msg2.modeA, msg2.modeB);
                loop_rate.sleep();
        }


        return 1;
}
