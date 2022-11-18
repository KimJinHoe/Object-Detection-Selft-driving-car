#include "ros/ros.h"
#include "communication_interface/test.h"
#include <time.h>
#include <chrono>
#include <sys/time.h>
#include <ctime>
#include "communication_interface/connector.h"
/*
using namespace nodelet_sample;

int main(int argc, char **argv)
{
        ros::init(argc, argv, "speed");
        ros::NodeHandle nh;
        ros::NodeHandle private_nh("~");
        connector ns;
        
        ns.init(nh, private_nh);
        ros::spin();


        return 1;
}
*/
/*
int main(int argc, char **argv)
{
ros::init(argc, argv, "speed_publisher");
ros::NodeHandle nh; 
ros::Publisher ros_tutorial_pub = nh.advertise<communication_interface::test>("speed_msg", 100);

ros::Rate loop_rate(100);

communication_interface::test msg;
struct timeval time_now{};

int flag;
int speed;
gettimeofday(&time_now, nullptr);
time_t prev_time =  (time_now.tv_sec * 1000000) + (time_now.tv_usec);
    while (ros::ok())
    {

        printf("flag : %d\n", flag);
        gettimeofday(&time_now, nullptr);
        time_t now_time =  (time_now.tv_sec * 1000000) + (time_now.tv_usec);

        /*
        if(now_time - prev_time > 500000)
        {
            prev_time =  (time_now.tv_sec * 1000000) + (time_now.tv_usec);

            if(flag == 0)
            {
                speed = -20000;
                flag++;
            }
            else if(flag == 1)
            {
                speed = -20000;
                flag++;
            }
            else if(flag == 2)
            {
                speed = -20000;
                flag++;
            }
            else
            {
             speed = -10000;
                flag = 0;
            }
            std::cout << "test" << std::endl;
        }
        
        if(now_time - prev_time < 500000)
        {
            speed = -20000;
        }
        else if(now_time - prev_time > 500000 && now_time - prev_time < 600000)
        {
            speed = 0;
        }
        else if(now_time - prev_time > 600000)
        {
            prev_time =  (time_now.tv_sec * 1000000) + (time_now.tv_usec);
            speed = -20000;
        }

        
        else if(now_time - prev_time > 125000 && now_time - prev_time < 150000)
        {
            speed = 0;
        }

        else if(now_time - prev_time > 150000 && now_time - prev_time < 250000)
        {
            speed = -20000;
        }

        else if(now_time - prev_time > 250000 && now_time - prev_time < 275000)
        {
            speed = -20000;

        }
        else if(now_time - prev_time > 275000 && now_time - prev_time < 350000)
        {
            speed = -20000;

        }
        else if(now_time - prev_time > 350000 && now_time - prev_time < 375000)
        {
            speed = 0;
        }

        else if(now_time - prev_time > 375000)
        {
            speed = 0;
            prev_time =  (time_now.tv_sec * 1000000) + (time_now.tv_usec);
        
        msg.data = speed;
        ROS_INFO("send msg = %d", msg.data);
        ros_tutorial_pub.publish(msg);
        //loop_rate.sleep();
    }
return 0;
}
*/

int main(int argc, char **argv)
{
ros::init(argc, argv, "speed_publisher");
ros::NodeHandle nh;
ros::Publisher ros_tutorial_pub = nh.advertise<communication_interface::test>("speed_msg", 100);

ros::Rate loop_rate(50);

communication_interface::test msg;
int speed = -20000;
while (ros::ok())
{
    msg.data = speed;
    ROS_INFO("send msg = %d", msg.data);
    ros_tutorial_pub.publish(msg);
    loop_rate.sleep();
}
return 0;
}




