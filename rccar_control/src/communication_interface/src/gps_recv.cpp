#include "communication_interface/udp.h"
#include "communication_interface/connector.h"
#include "ros/ros.h"
#include <thread>

#define CLIENT_ID 1
#define SERVER_ID 0

int main(int argc, char **argv)
{
        ros::init(argc, argv, "gps_recv");
        udp udp_gps(SERVER_ID, "192.168.0.154", 8888);
	string temp;
        while(1)
        {
             temp = udp_gps.recv_text();
             std::cout << temp <<std::endl;
        }

        return 0;
}
