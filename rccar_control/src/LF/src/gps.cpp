/***
 * This example expects the serial port has a loopback on it.
 *
 * Alternatively, you could use an Arduino:
 *
 * <pre>
 *  void setup() {
 *    Serial.begin(<insert your baudrate here>);
 *  }
 *
 *  void loop() {
 *    if (Serial.available()) {
 *      Serial.write(Serial.read());
 *    }
 *  }
 * </pre>
 */

#include <ros/ros.h>
#include <serial/serial.h>
#include <std_msgs/String.h>
#include <std_msgs/Empty.h>
#include <string>
#include <memory.h>
#include <iostream>
#include <cstring>
#include <vector>
#include <sstream>
#include <cstring>
#include "LF/MsgGPS.h"
serial::Serial ser;

double time_;
double latitude;
char lati_dir;
double longitude;
char longi_dir;
int fix;
int satelite_num;
double horizon_position;
double altitude;



char alti_dir;
double update_time;
int dgps_id;
int check_sum;

using namespace std;

struct gps_value
{
   unsigned currenttime;
   double lati, longi;
};

void write_callback(const std_msgs::String::ConstPtr& msg){
    ROS_INFO_STREAM("Writing to serial port" << msg->data);
    ser.write(msg->data);
}

vector<string> split2(string s, string divid) {
        vector<string> v;
        int start = 0;
        int d = s.find(divid);
        while (d != -1){
                v.push_back(s.substr(start, d - start));
                start = d + 1;
                d = s.find(divid, start);
        }
        v.push_back(s.substr(start, d - start));

        return v;
}

int gpgga(char* buffer)
{
   char temp_buffer[6];

   for(int i = 0; i < 6; i ++)
   {
      temp_buffer[i] = buffer[i];
   }
   temp_buffer[6] = '\0';
   std::cout <<temp_buffer << std::endl;
   if(strcmp(temp_buffer, "$GNGGA") == 0)
      return 1;
   else
      return 0;
}

double find_val(char* buffer, int c)
{
    //cout << buffer << endl;
    int value;
    double angle;
    double result = -1;
    //0: latitude, 1: longitude 2: current_time
    sscanf(buffer, "$GNGGA,%lf,%lf,%c,%lf,%c,%i,%i,%lf,%lf,%c,%lf,%d,*%d", &time_, &latitude, &lati_dir, &longitude, &longi_dir, &fix, &satelite_num, &horizon_position, &altitude, &alti_dir, &update_time, &dgps_id, &check_sum);
    //std::cout <<buffer << std::endl;
    if(c == 0)
    {
   value = latitude / 100;
   angle = (latitude - (value * 100)) / 60;
   result = value + angle;
    }
    if(c == 1)
    {
   value = longitude / 100;
   angle = (longitude - (value * 100)) / 60;
   result = value + angle;

   if(longitude < 100) longitude += 100;
    }
    if(c==2)//HHMMSS.sss 000000.000~235959.999
    {
   result = time_ + 90000; //korea time
   if(result >=240000) result -= 240000;

    }
    return result;
}

int main (int argc, char** argv){
    ros::init(argc, argv, "GPS_data");
    ros::NodeHandle nh;
    LF::MsgGPS MsgGPS;
    //ros::Subscriber write_sub = nh.subscribe("write", 1000, write_callback);
    ros::Publisher gps_pub = nh.advertise<LF::MsgGPS>("GPS", 100);

    const char* test_buffer;
    struct gps_value ret_value;

    try
    {
        ser.setPort("/dev/ttyUSB1");
        ser.setBaudrate(9600);
        serial::Timeout to = serial::Timeout::simpleTimeout(1000);
        ser.setTimeout(to);
        ser.open();
    }
    catch (serial::IOException& e)
    {
        ROS_ERROR_STREAM("Unable to open port ");
        return -1;
    }

    if(ser.isOpen()){
        ROS_INFO_STREAM("Serial Port initialized");
    }else{
        return -1;
    }

    ros::Rate loop_rate(1);
    while(ros::ok()){
        std::string gps;
        ros::spinOnce();

        while(ser.available())
        {
            ROS_INFO_STREAM("Reading from serial port");
            //std_msgs::String result;

            //result.data = ser.read(ser.available());
            gps = ser.read(ser.available());
            const char* gps_data = gps.c_str();
            //strcpy(dest, gps_data);
            //std::cout << dest << std::endl;
            //std::cout << gps.length() << std::endl;
            //std::cout << gps.find("$GPGGA") <<std::endl;
            //std::cout << gps_data <<std::endl;
            int index = gps.find("$GNGGA");
            int index2 = gps.find("$GNGSA");
            int buffer_index = 0;
            char result[index2-index];


            for(int i = 0; i < index2-index; i++)
            {
                result[i] = gps_data[i+index];
            }
            std::cout << result;

            //int num = gpgga(result);
            //printf("num = %d\n", num);

            if(gpgga(result) == 1)
            {
           //cout << buffer << endl;
           ret_value.lati = find_val(result, 0);
           MsgGPS.lati = ret_value.lati;
           ret_value.longi = find_val(result, 1);
           MsgGPS.longi = ret_value.longi;
           ret_value.currenttime = find_val(result,2);

            }
            else
            {
           ret_value.currenttime = ret_value.lati = ret_value.longi = -1;
            }
            gps_pub.publish(MsgGPS);
            printf("lati : %lf, longi : %lf, time : %lf\n", ret_value.lati, ret_value.longi, ret_value.currenttime);
            ROS_INFO("lati : %lf longi : %lf", MsgGPS.lati, MsgGPS.longi);
            /*
            for(std::string::iterator iter = gps.begin(); iter != gps.end(); iter++)
            {
                std::cout << *iter << std::endl;
            }
            */
            //ROS_INFO_STREAM("Read: " << result.data);
            //read_pub.publish(result);

            }
        loop_rate.sleep();

    }
}

/*
int previous = 0;
int current = 0;
vector<string> x;
x.clear();

current= gps.find('\n');
while(current!=string::npos){
    string substring=gps.substr(previous,current-previous);
    x.push_back(substring);
    previous = current+1;
    current=gps.find('\n',previous);
}
x.push_back(gps.substr(previous,current-previous));
string test1 = x[2];
const char* test2 = test1.c_str();

vector<string> v = split2(gps, "\n");
for(string i : v)
{
    std::cout << i <<"\n";
}

*/

