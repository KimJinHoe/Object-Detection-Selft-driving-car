#include "communication_interface/udp.h"
#include <unistd.h>

udp::udp(int mode, char *ip, int port)
{
        clientAddressLength = 0;

        memset(&serverAddress, 0, sizeof(serverAddress));
        memset(&clientAddress, 0, sizeof(clientAddress));

        this->mode = mode;
        this->port = port;
        if(mode == 0)
        {
                cout << "UDP Server Start" << endl;
                cout << "Port num = " << port << endl;
                //sprintf(this->ip, "%s", ip);
                cout << "Initiate UDP server" << endl;
                udpServer_init();
                cout << "Create socket UDP server" << endl;
                udpServer_socketCreate();
                cout << "Bind socket UDP server" << endl;
                udpServer_bind();
                cout << "Finish to ready UDP Server" << endl;
        }
        else
        {
                this->ip = ip;
                cout << "UDP Client Start" << endl;
                cout << "Port num = " << port << endl;
                cout << "Target = " << ip << endl;
                cout << "Initiate UDP client" << endl;
                udpClient_init();
                cout << "Create socket UDP client" << endl;
                udpClient_socketCreate();
                cout << "Finish to ready UDP client" << endl;

        }

}

udp::~udp()
{
        if(mode == 0)
        {
                cout << "UDP Server close" << endl;
                close(server_fd);
        }
        else
        {
                cout << "UDP Client close" << endl;
                close(client_socket);
        }
}

void udp::m_run()
{
    udp_reciever_->send_text("-20000");
    sleep(1);
}

//UDP Server Function

void udp::udpServer_init()
{
        serverAddress.sin_family = AF_INET;
        serverAddress.sin_addr.s_addr = htonl(INADDR_ANY);
        serverAddress.sin_port = htons(port);

}


void udp::udpServer_socketCreate()
{
        if ((server_fd = socket(AF_INET, SOCK_DGRAM, 0)) == -1)
        {
                cout << "Open server socket err" << endl;
        }

}

void udp::udpServer_bind()
{
        if (bind(server_fd, (struct sockaddr *)&serverAddress, sizeof(serverAddress)) < 0)
        {
                printf("Server : can not bind local address");
        }
}

//UDP Client Function

void udp::udpClient_init()
{
        serverAddress.sin_family = AF_INET;
        inet_aton(ip, (struct in_addr*) &serverAddress.sin_addr.s_addr);
        serverAddress.sin_port = htons(port);
}

void udp::udpClient_socketCreate()
{
        if ((client_socket = socket(PF_INET, SOCK_DGRAM, 0)) == -1)
        {
                cout << "Open client socket err" << endl;
        }

}

struct SendEventDataVehicle udp::recv_RSU()
{
        rsu_data;

        if(mode == 0)
        {

                struct sockaddr_in connectSocket;
                socklen_t connectSocketLength = sizeof(connectSocket);
                getpeername(client_fd, (struct sockaddr*)&clientAddress, &connectSocketLength);
                char clientIP[sizeof(clientAddress.sin_addr) + 1] = { 0 };
                sprintf(clientIP, "%s", inet_ntoa(clientAddress.sin_addr));

                if(strcmp(clientIP,"0.0.0.0") != 0)
                        cout << "Client : " << clientIP << endl;

                client_addr_size = sizeof(clientAddress);

                receivedBytes = recvfrom(server_fd, (SendEventDataVehicle *)&rsu_data, sizeof(rsu_data), 0, (struct sockaddr*)&clientAddress, (socklen_t*)&client_addr_size);

        }
        else
        {
                receivedBytes = recvfrom(client_socket, (SendEventDataVehicle *)&rsu_data, sizeof(rsu_data), 0, (struct sockaddr*)&serverAddress, (socklen_t*)&server_addr_size);
        }

        //cout << receivedBytes << " byte" << endl;
        /*
        printf("%d, %f, %f, %f, %d, %f, %f, %d, %f, %f, %f, %f, %d" , Vehicle_data.ID, Vehicle_data.curLongitudeGpsInfo, Vehicle_data.curLatitudeGpsInfo,Vehicle_data.direction,
               Vehicle_data.nCurLane, Vehicle_data.destLongitudeGpsInfo, Vehicle_data.destLatitudeGpsInfo, Vehicle_data.savedTime, Vehicle_data.dFrontLidarInfo, Vehicle_data.dLeftLidarInfo, Vehicle_data.dRightLidarInfo,
               Vehicle_data.dRearLidarInfo, Vehicle_data.nCurSpeed);
               */
        //printf("%d, %d\n", Vehicle_data.ID, Vehicle_data.nCurSpeed);
        return rsu_data;
}

void udp::recv(DataObjectQueue* qObj)
//void udp::recv()
//struct RecvDataVehicle udp::recv()
{
         Vehicle_data_rc;
    while(1){
        mtx.lock();
        if(mode == 0)
        {

                struct sockaddr_in connectSocket;
                socklen_t connectSocketLength = sizeof(connectSocket);
                getpeername(client_fd, (struct sockaddr*)&clientAddress, &connectSocketLength);
                char clientIP[sizeof(clientAddress.sin_addr) + 1] = { 0 };
                sprintf(clientIP, "%s", inet_ntoa(clientAddress.sin_addr));

                if(strcmp(clientIP,"0.0.0.0") != 0)
                        cout << "Client : " << clientIP << endl;

                client_addr_size = sizeof(clientAddress);

                receivedBytes = recvfrom(server_fd, (RecvDataVehicle *)&Vehicle_data_rc, sizeof(Vehicle_data_rc), 0, (struct sockaddr*)&clientAddress, (socklen_t*)&client_addr_size);

        }
        else
        {
                receivedBytes = recvfrom(client_socket, (RecvDataVehicle *)&Vehicle_data_rc, sizeof(Vehicle_data_rc), 0, (struct sockaddr*)&serverAddress, (socklen_t*)&server_addr_size);
                qObj->put(Vehicle_data_rc);
        }

        //cout << receivedBytes << " byte" << endl;

        /*
        printf("%d, %lf, %lf, %f, %d, %f, %f, %s, %f, %f, %f, %f, %d\n" , Vehicle_data_rc.ID, Vehicle_data_rc.curLongitudeGpsInfo, Vehicle_data_rc.curLatitudeGpsInfo, Vehicle_data_rc.direction,
               Vehicle_data_rc.nCurLane, Vehicle_data_rc.destLongitudeGpsInfo, Vehicle_data_rc.destLatitudeGpsInfo, Vehicle_data_rc.savedTime, Vehicle_data_rc.dFrontLidarInfo, Vehicle_data_rc.dLeftLidarInfo, Vehicle_data_rc.dRightLidarInfo,
               Vehicle_data_rc.dRearLidarInfo, Vehicle_data_rc.nCurSpeed);


        //return Vehicle_data_rc;*/
        mtx.unlock();
        usleep(1000);
    }

}


void udp::recv_rc()
{
        data;
        if(mode == 0)
        {

                struct sockaddr_in connectSocket;
                socklen_t connectSocketLength = sizeof(connectSocket);
                getpeername(client_fd, (struct sockaddr*)&clientAddress, &connectSocketLength);
                char clientIP[sizeof(clientAddress.sin_addr) + 1] = { 0 };
                sprintf(clientIP, "%s", inet_ntoa(clientAddress.sin_addr));

                if(strcmp(clientIP,"0.0.0.0") != 0)
                        cout << "Client : " << clientIP << endl;

                client_addr_size = sizeof(clientAddress);

                receivedBytes = recvfrom(server_fd, (vehicle_data *)&data, sizeof(data), 0, (struct sockaddr*)&clientAddress, (socklen_t*)&client_addr_size);

        }
        else
        {
                receivedBytes = recvfrom(client_socket, (vehicle_data *)&data, sizeof(data), 0, (struct sockaddr*)&serverAddress, (socklen_t*)&server_addr_size);
        }

        printf("recv lati : %lf, longi : %lf", data.longi, data.lati);
        cout << receivedBytes << " byte" << endl;
    //return data;
}

void udp::send(struct RecvDataVehicle* data)
{
    //Vehicle_data.header.DataType = data->header.DataType;
    Vehicle_data_recv.header.DataType = 0;
    //Vehicle_data.header.DataLength = data->header.DataLength;
    Vehicle_data_recv.header.DataLength = 112;
    Vehicle_data_recv.ID = data->ID;
    Vehicle_data_recv.nCurSpeed = data->nCurSpeed;
    Vehicle_data_recv.curLongitudeGpsInfo = data->curLongitudeGpsInfo;
    Vehicle_data_recv.curLatitudeGpsInfo = data->curLatitudeGpsInfo;
    Vehicle_data_recv.direction = data->direction;
    Vehicle_data_recv.nCurLane = data->nCurLane;
    Vehicle_data_recv.destLongitudeGpsInfo = data->destLongitudeGpsInfo;
    Vehicle_data_recv.destLatitudeGpsInfo = data->destLatitudeGpsInfo;
    strcpy(Vehicle_data_recv.savedTime,  data->savedTime);
    Vehicle_data_recv.dFrontLidarInfo = data->dFrontLidarInfo;
    Vehicle_data_recv.dLeftLidarInfo = data->dLeftLidarInfo;
    Vehicle_data_recv.dRightLidarInfo = data->dRightLidarInfo;
    Vehicle_data_recv.dRearLidarInfo = data->dRearLidarInfo;


    printf("%d, %lf, %lf\n", Vehicle_data_recv.ID, Vehicle_data_recv.curLongitudeGpsInfo, Vehicle_data_recv.curLatitudeGpsInfo);

        if(mode == 0)
        {
                sentBytes = sendto(server_fd, (RecvDataVehicle *)&Vehicle_data_recv, sizeof(Vehicle_data_recv), 0, (struct sockaddr*)&clientAddress, sizeof(clientAddress));
                printf("%d\n %d, %d", sizeof(RecvDataVehicle), sizeof(sentBytes), sizeof(Vehicle_data_recv));
                //sentBytes = sendto(server_fd, sendBuff, 112, 0, (struct sockaddr*)&clientAddress, sizeof(clientAddress));
        }
        else
        {
                //server_addr_size = sizeof(serverAddress);
                sentBytes = sendto(client_socket, (RecvDataVehicle *)&Vehicle_data_recv, sizeof(Vehicle_data_recv), 0, (struct sockaddr*)&serverAddress, sizeof(serverAddress));
                //printf("%d\n %d\n, %d\n", sizeof(RecvDataVehicle_con), sizeof(sentBytes), sizeof(data));
                //sentBytes = sendto(client_socket, sendBuff, 112, 0, (struct sockaddr*)&serverAddress, sizeof(serverAddress));
        }
}
/*
void udp::send_rc(DataObjectQueue* qObj)
{
    data_recv.longi = data->longi;
    data_recv.lati = data->lati;

    printf("send %lf, %lf\n", data_recv.longi, data_recv.lati);
        if(mode == 0)
        {
                sentBytes = sendto(server_fd, (vehicle_data*)&data_recv, sizeof(data_recv), 0, (struct sockaddr*)&clientAddress, sizeof(clientAddress));
                printf("%d, %d\n", sizeof(sentBytes), sizeof(data_recv));
                //sentBytes = sendto(server_fd, sendBuff, 112, 0, (struct sockaddr*)&clientAddress, sizeof(clientAddress));
        }
        else
        {
                //server_addr_size = sizeof(serverAddress);
                sentBytes = sendto(client_socket, (vehicle_data*)&data_recv, sizeof(data_recv), 0, (struct sockaddr*)&serverAddress, sizeof(serverAddress));
                //printf("%d\n %d\n, %d\n", sizeof(RecvDataVehicle_con), sizeof(sentBytes), sizeof(data));
                //sentBytes = sendto(client_socket, sendBuff, 112, 0, (struct sockaddr*)&serverAddress, sizeof(serverAddress));
        }
}
*/


void udp::send()
{
    struct RecvDataVehicle Vehicle_data_recv;



        if(mode == 0)
        {
                sentBytes = sendto(server_fd, (RecvDataVehicle*)&Vehicle_data_recv, sizeof(Vehicle_data_recv), 0, (struct sockaddr*)&clientAddress, sizeof(clientAddress));
        }
        else
        {
                //server_addr_size = sizeof(serverAddress);
                sentBytes = sendto(client_socket, (RecvDataVehicle*)&Vehicle_data_recv, sizeof(Vehicle_data_recv), 0, (struct sockaddr*)&serverAddress, sizeof(serverAddress));
        }
        /*
        printf("%d, %f, %f, %f, %d, %f, %f, %d, %f, %f, %f, %f, %d\n" , Vehicle_data_recv.ID, Vehicle_data_recv.curLongitudeGpsInfo, Vehicle_data_recv.curLatitudeGpsInfo,Vehicle_data_recv.direction,
               Vehicle_data_recv.nCurLane, Vehicle_data_recv.destLongitudeGpsInfo, Vehicle_data_recv.destLatitudeGpsInfo, Vehicle_data_recv.savedTime, Vehicle_data_recv.dFrontLidarInfo, Vehicle_data_recv.dLeftLidarInfo, Vehicle_data_recv.dRightLidarInfo,
               Vehicle_data_recv.dRearLidarInfo, Vehicle_data_recv.nCurSpeed);
        */

}

string udp::recv_text()
{
        char readBuff[BUFF_SIZE];

        if(mode == 0)
        {

                struct sockaddr_in connectSocket;
                socklen_t connectSocketLength = sizeof(connectSocket);
                getpeername(client_fd, (struct sockaddr*)&clientAddress, &connectSocketLength);
                char clientIP[sizeof(clientAddress.sin_addr) + 1] = { 0 };
                sprintf(clientIP, "%s", inet_ntoa(clientAddress.sin_addr));

                //if(strcmp(clientIP,"0.0.0.0") != 0)
                        cout << "Client : " << clientIP << endl;

                client_addr_size = sizeof(clientAddress);

                receivedBytes = recvfrom(server_fd, readBuff, BUFF_SIZE, 0, (struct sockaddr*)&clientAddress, (socklen_t*)&client_addr_size);

        }
        else
        {
                receivedBytes = recvfrom(client_socket, readBuff, BUFF_SIZE, 0, (struct sockaddr*)&serverAddress, (socklen_t*)&server_addr_size);
        }

        //cout << receivedBytes << " byte" << endl;
        string returnBuff;
        readBuff[receivedBytes] = '\0';
        returnBuff = readBuff;


        fputs(readBuff, stdout);
        fflush(stdout);
        //cout << returnBuff << endl;
        return returnBuff;
}

void udp::send_text(char *msg)
{
    while(1){
        char sendBuff[4096];
        sprintf(sendBuff, "%s", msg);
        if(mode == 0)
        {
                sentBytes = sendto(server_fd, sendBuff, strlen(sendBuff), 0, (struct sockaddr*)&clientAddress, sizeof(clientAddress));
        }
        else
        {
                //server_addr_size = sizeof(serverAddress);
                sentBytes = sendto(client_socket, sendBuff, strlen(sendBuff), 0, (struct sockaddr*)&serverAddress, sizeof(serverAddress));
        }
    }
}

void udp::queue_pop(DataObjectQueue* qObj)
{
    bool size;
    struct RecvDataVehicle queue_pop;
    char buffer[20];
    while(1){
        mtx.lock();
        if(!qObj->IsQueueEmpty())
        {
            queue_pop = qObj->get();
            //printf("%lf, %lf\n", queue_pop.curLongitudeGpsInfo, queue_pop.curLatitudeGpsInfo);
            sprintf(buffer, "%lf,%lf,", queue_pop.curLongitudeGpsInfo, queue_pop.curLatitudeGpsInfo);
            //printf("%s", buffer);
            sentBytes = sendto(client_socket, buffer, strlen(buffer), 0, (struct sockaddr*)&serverAddress, sizeof(serverAddress));
        }

        mtx.unlock();
        usleep(1000);
    }


}

void udp::get_udp(void* obj)
{
    udp_gps_ = (udp*) obj;
}
//void udp::start_recv(char *msg, DataObjectQueue* qRecvObj, DataObjectQueue* qSendObj)
void udp::start_recv(char *msg, DataObjectQueue* qRecvObj)
{
    std::thread(&udp::send_text, this, msg).detach();
    std::thread(&udp::recv, this, qRecvObj).detach();
    //std::thread(&udp::queue_pop, this, qSendObj).detach();
}
void udp::start_send(DataObjectQueue* qSendObj)
{
    std::thread(&udp::queue_pop, this, qSendObj).detach();
}
void udp::thread_recv()
{
    std::thread(&udp::recv_text, this).detach();
}




