#ifndef __UDP__
#define __UDP__

# include <stdio.h>
# include <iostream>
# include <string.h>
# include <stdlib.h>
# include <netinet/in.h>
# include <sys/socket.h>
# include <arpa/inet.h>
# include <unistd.h>
# include <thread>
# include <mutex>
# include "communication_interface/DataObjectQueue.h"
#define BUFF_SIZE 4096

using namespace std;

class udp
{
	public:
		udp(int mode, char* ip, int port); //0: Server, 1: Client
		~udp();
		//void recv();
		void recv(DataObjectQueue* qObj);
		void queue_pop(DataObjectQueue* qObj);
		//struct RecvDataVehicle recv();
		void recv_rc();
		struct SendEventDataVehicle recv_RSU();
		void send(struct RecvDataVehicle* data);
		void send_rc(DataObjectQueue* qObj);
		void send();
		string recv_text();
		void send_text(char *msg);
		//void start_recv(char *msg, DataObjectQueue* qRecvObj, DataObjectQueue* qSendObj);
		void start_recv(char *msg, DataObjectQueue* qRecvObj);
		void start_send(DataObjectQueue* qSendObj);
		void thread_recv();
		void get_udp(void* obj);
		struct RecvDataVehicle Vehicle_data_rc;
		struct RecvDataVehicle server_recv;
		struct SendEventDataVehicle rsu_data;
		struct RecvDataVehicle Vehicle_data_recv;
		struct vehicle_data data;
		struct vehicle_data data_recv;
		
		
	private:
		void udpServer_init();
		void udpServer_socketCreate();
		void udpServer_bind();
		void udpClient_init();
		void udpClient_socketCreate();
		void m_run();
		
		std::mutex mtx;
		std::mutex mtx2;
		
		int mode;
		char* ip;
		int port;

		int server_addr_size;
		socklen_t clientAddressLength;
		struct sockaddr_in serverAddress, clientAddress;
		int client_socket;
		int server_fd, client_fd;
		int client_addr_size;
		ssize_t receivedBytes;
		ssize_t sentBytes;
		int buff_size;
		udp* udp_reciever_;
		udp* udp_gps_;
	 
};

#endif
