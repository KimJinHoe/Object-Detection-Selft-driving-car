#ifndef __CONNECTOR__
#define __CONNECTOR__

# include <stdio.h>
# include <iostream>
# include <string.h>
# include <stdlib.h>
# include <netinet/in.h>
# include <sys/socket.h>
# include <arpa/inet.h>
# include <unistd.h>
#include "ros/ros.h"
#include "communication_interface/udp.h"
//#include "communication_interface/GPS_data.h"
#include "communication_interface/test.h"
#include "communication_interface/test2.h"
#include "LF/MsgGPS.h"
#include "DMF/MsgnCurLane.h"
#include <thread>



namespace nodelet_sample
{
class connector
{
public:
	//connector(void* obj);
	connector();
	~connector();
	void get_udp(void* obj);
	//void msgCallback2(const communication_interface::test2::ConstPtr &test);
	void msgCallback2(const LF::MsgGPS::ConstPtr &msg);
	void msgCallback(const DMF::MsgnCurLane::ConstPtr &msg);
	void send();
	void send_text();
	void start();
	void init(ros::NodeHandle &nh, ros::NodeHandle &private_nh);
	void m_run();
	void m_run_pub();

	struct RecvDataVehicle Vehicle_data;
	struct RecvDataVehicle vehicle_data;
	struct vehicle_data vehicle_data_conn;
	struct test v_data;
	udp* udp_sender_;
	udp* udp_reciever_;
	

private:
	ros::Subscriber sub_;
	ros::Publisher pub_;
	ros::NodeHandle n_recv;
	ros::Subscriber sub_recv;
	ros::Publisher pub_recv;
	ros::Publisher speed_pub;
	
};

};
#endif
