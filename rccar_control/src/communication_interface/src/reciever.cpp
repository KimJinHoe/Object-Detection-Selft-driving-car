#include "communication_interface/udp.h"
#include "communication_interface/connector.h"
#include "ros/ros.h"
#include <thread>

#define CLIENT_ID 1
#define SERVER_ID 0

using namespace nodelet_sample;
/*
int main()
{
        udp udp_reciever(CLIENT_ID, "127.0.0.1", 9999);
        //string temp;
        struct RecvDataVehicle recv;
        //struct vehicle_data recv;
        //struct test vehicle_data;
        udp_reciever.send_text("start");
        while(1)
        {
                recv = udp_reciever.recv();
                printf("%d, %lf, %lf, %f, %d, %f, %f, %s, %f, %f, %f, %f, %d\n" , recv.ID, recv.curLongitudeGpsInfo, recv.curLatitudeGpsInfo, recv.direction,
                       recv.nCurLane, recv.destLongitudeGpsInfo, recv.destLatitudeGpsInfo, recv.savedTime, recv.dFrontLidarInfo, recv.dLeftLidarInfo, recv.dRightLidarInfo,
                       recv.dRearLidarInfo, recv.nCurSpeed);
                sleep(1);
                //printf("%d, %d\n", Vehicle_data_recv.ID, Vehicle_data_recv.nCurSpeed);

                //udp_reciever.send("aa");
                //sleep(1);
        }
        return 0;
}
*/
// speed send & gps recv
/*
void m_run(void* obj)
{
    connector client_;
    connector *pconnector;
    pconnector = &client_;
    pconnector->send_text("20000");
    sleep(1);
}
*/
void m_run(void* obj)
{
    connector client_;
    connector *pconnector;
    pconnector = &client_;
    while(1)
    {
        pconnector->send_text();
        sleep(1);
    }
}

int main(int argc, char **argv)
{
        ros::init(argc, argv, "udp_reciever");
        udp udp_reciever(CLIENT_ID, "127.0.0.1", 9999);
        udp gps_send(CLIENT_ID, "192.168.1.116", 7777);
        //gps_send.get_udp(&gps_send);

        //udp_reciever.send_text("11");

        DataObjectQueue* Recv_Queue = new DataObjectQueue();
        struct RecvDataVehicle Vehicle_data_recv;
        udp_reciever.start_recv("-20000", Recv_Queue);
        gps_send.start_send(Recv_Queue);
         while(1)
        {
             //Vehicle_data_recv = Recv_Queue->get();
             //printf("longi : %lf lati : %lf", Vehicle_data_recv.curLongitudeGpsInfo, Vehicle_data_recv.curLatitudeGpsInfo);


        }

        return 0;
}

// speed send main
/*
int main()
{
        udp udp_reciever(CLIENT_ID, "127.0.0.1", 9999);

        udp_reciever.send_text("11");
        while(1)
        {
            udp_reciever.send_text("-20000");
            sleep(1);
        }
        return 1;
}
*/
/*
//RSU test
int main()
{
        udp udp_reciever(CLIENT_ID, "192.168.0.177", 50001);
        //string temp;
        struct SendEventDataVehicle rsu_recv_data;
        //struct test vehicle_data;
        udp_reciever.send_text("11");
        while(1)
        {

                rsu_recv_data = udp_reciever.recv_RSU();
                printf("%d, %d, %d, %s, %f\n" , rsu_recv_data.ID, rsu_recv_data. eventType, rsu_recv_data.direction, rsu_recv_data. stop, rsu_recv_data.speed);
                sleep(1);
                //udp_reciever.send("aa");
                //sleep(1);



        }
        return 1;
}

*/
/*
int main()
{
        udp udp_reciever(0, "127.0.0.1", 9999);

        while(1)
        {

                udp_reciever.vc_data = udp_reciever.recv();
                printf("%d\n", sizeof(udp_reciever.vc_data));
               // cout << udp_reciever.vc_data.direction << endl;
                //cout << udp_reciever.vc_data.savedTime << endl;
                //udp_reciever.recv();
                sleep(3);
                //udp_reciever.send("aa");
                //sleep(1);
        }
        return 1;
}

*/
