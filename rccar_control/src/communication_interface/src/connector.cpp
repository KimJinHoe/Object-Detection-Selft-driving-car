#include "communication_interface/connector.h"
#include "communication_interface/test.h"
#include "ros/ros.h"
#include "communication_interface/udp.h"
#include "communication_interface/test2.h"
#include "DMF/MsgnCurLane.h"
#include "LF/MsgGPS.h"
#include <sstream>
#include <stdlib.h>

namespace nodelet_sample
{
/*
connector::connector(void* obj)
{
        udp_sender_ = (udp*) obj;
        //pub_recv = n_recv.advertise<communication_interface::test>("test", 100);
        //sub_recv = n_recv.subscribe("test", 100, &connector::testCallback, this);

}
*/
connector::connector()
{
    speed_pub = n_recv.advertise<communication_interface::test>("speed_msg", 100);

}
connector::~connector()
{
}
void connector::get_udp(void* obj)
{
    udp_sender_ = (udp*) obj;
}
/*
void connector::msgCallback(const communication_interface::GPS_data::ConstPtr &msg)
{
        char Buff[4096];
        sprintf(Buff, "%d", msg->data);
        ROS_INFO("recieve msg: %d", msg->data);
        udp_sender_->send(Buff);
}
*/

void connector::msgCallback(const DMF::MsgnCurLane::ConstPtr &msg)
{
   Vehicle_data.nCurLane = msg->nCurLane;
}
/*
void connector::msgCallback2(const communication_interface::test2::ConstPtr &test)
{

    Vehicle_data.nCurSpeed = test->data;
    //ROS_INFO("recieve msg: %d", test->data);
    //printf("%d\n", sizeof(Vehicle_data));


}
*/
/*
void connector::msgCallback2(const LF::MsgGPS::ConstPtr &msg)
{
    vehicle_data_conn.longi = msg->longi;	//°æµµ
    vehicle_data_conn.lati = msg->lati;
    udp_sender_->send_rc(&vehicle_data_conn);

    //ROS_INFO("longi : %lf lati : %lf", vehicle_data_conn.longi, vehicle_data_conn.lati);
    printf("%d\n", sizeof(vehicle_data_conn));


}
*/
void connector::msgCallback2(const LF::MsgGPS::ConstPtr &msg)
{
    Vehicle_data.header.DataType = 0;
    Vehicle_data.header.DataLength = 112;
    Vehicle_data.ID = 1;
    Vehicle_data.curLongitudeGpsInfo = msg->longi;	//°æµµ
    Vehicle_data.curLatitudeGpsInfo = msg->lati;		//À§µµ
    Vehicle_data.direction = 4;				//Direction
    //Vehicle_data.nCurLane = 5;				//ÇöÀç ¿îÇà Â÷¼± Á¤º¸
    Vehicle_data.destLongitudeGpsInfo = 6;	//°æµµ
    Vehicle_data.destLatitudeGpsInfo = 7;	//À§µµ
    //strcpy(Vehicle_data.savedTime, "2021-04-20");			//Â÷·®¿¡¼­ º¸³½ ¸Þ½ÃÁö¸¦ ÀúÀåÇÏ´Â ½Ã°£	2021-03-31 12:12:12:999
    strcpy(Vehicle_data.savedTime, "2021-03-31 12:12:12:999");
    Vehicle_data.dFrontLidarInfo = 9;		//Â÷·®¿¡¼­ ¹ÞÀº ¶óÀÌ´õ Á¤º¸
    Vehicle_data.dLeftLidarInfo = 10;			//Â÷·®¿¡¼­ ¹ÞÀº ¶óÀÌ´õ Á¤º¸
    Vehicle_data.dRightLidarInfo = 11;		//Â÷·®¿¡¼­ ¹ÞÀº ¶óÀÌ´õ Á¤º¸
    Vehicle_data.dRearLidarInfo = 12;
    Vehicle_data.nCurSpeed = 13;
    //ROS_INFO("recieve msg: %d", msg->data);
    //printf("ID = %d, speed = %d\n", Vehicle_data.ID, Vehicle_data.nCurSpeed);
    udp_sender_->send(&Vehicle_data);


}

void connector::init(ros::NodeHandle &nh, ros::NodeHandle &private_nh)
{
    sub_ = nh.subscribe("MsgnCurLane", 100, &connector::msgCallback, this);
    sub_recv = nh.subscribe("GPS", 100, &connector::msgCallback2, this);
}


void connector::send()
{
    std::thread m_thread(&connector::m_run, this);
    //m_thread.detach();
    m_thread.join();
}

void connector::m_run()
{
    while(1)
    {
        udp_reciever_->send_text("-20000");
        sleep(1);
    }
}

void connector::m_run_pub()
{
    while(1)
    {
        communication_interface::test test;
        ros::Rate loop_rate(10);
        string temp;
        temp = udp_sender_->recv_text();
        //cout << temp << endl;
        std::stringstream sslnt(temp);
        sslnt >> test.data;
        ROS_INFO("speed = %d", test.data);
        speed_pub.publish(test);
        loop_rate.sleep();
    }
}

void connector::start()
{
    std::thread(&connector::m_run_pub, this).detach();
}

void connector::send_text()
{
        udp_reciever_->send_text("-20000");
}

}//namespace


