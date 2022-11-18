#include "communication_interface/udp.h"
#include "communication_interface/test.h"

#include "communication_interface/connector.h"
#include "ros/ros.h"

#define CLIENT_ID 1
#define SERVER_ID 0

using namespace nodelet_sample;

int main(int argc, char **argv)
{
        ros::init(argc, argv, "udp_sender");
        ros::NodeHandle nh;
        ros::NodeHandle private_nh("~");
        udp udp_sender(SERVER_ID, "127.0.0.1", 9999);
        udp_sender.recv_text();
        connector ns;
        ns.get_udp(&udp_sender);

        ns.init(nh, private_nh);
        ros::spin();


        return 1;
}

/*
int main(int argc, char **argv)
{
        ros::init(argc, argv, "udp_sender");
        //ros::NodeHandle nh;
        //ros::Publisher ros_tutorial_pub = nh.advertise<communication_interface::test>("ros_tutorial_msg", 100);
        //communication_interface::test test;
        //ros::Rate loop_rate(10);

        udp udp_sender(1, "127.0.0.1", 9999);
        connector gps(&udp_sender);
        udp_sender.send("11");
        sleep(1);

        while(ros::ok())
        {
            gps.recv();
            //ROS_INFO("send msg = %d", test.data);
            //ros_tutorial_pub.publish(test);
            //loop_rate.sleep();

        }

        return 0;
}
*/

//speed recv main(thread)
/*
int main(int argc, char **argv)
{
        ros::init(argc, argv, "udp_sender");
        ros::NodeHandle nh;
        ros::NodeHandle private_nh("~");
        //ros::Publisher speed_pub = nh.advertise<communication_interface::test>("speed_msg", 100);
        //communication_interface::test test;
        ros::Rate loop_rate(10);
        string temp;

        udp udp_sender(SERVER_ID, "127.0.0.1", 9999);
        udp_sender.recv_text();

        connector ns;
        ns.get_udp(&udp_sender);

        while (ros::ok())
        {
            ns.recv();

            ns.init(nh, private_nh);
            //ros::spin();

        }
        return 0;
}
*/
//speed recv main
/*
int main(int argc, char **argv)
{
        ros::init(argc, argv, "udp_sender");
        ros::NodeHandle nh;
        ros::NodeHandle private_nh("~");
        //ros::Publisher speed_pub = nh.advertise<communication_interface::test>("speed_msg", 100);
        //communication_interface::test test;
        //ros::Rate loop_rate(10);
        //string temp;

        udp udp_sender(SERVER_ID, "127.0.0.1", 9999);
        udp_sender.recv_text();

        connector ns;
        ns.get_udp(&udp_sender);

        ns.start();
        ns.init(nh, private_nh);
        ros::spin();
        while (1)
        {



        }
        return 0;
}
*/
