#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>
#include <time.h>
#include <thread>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "DF/MsgRF.h"
#include "DF/MsgMode.h"
#include "DF/esc.h"
#include "DMF/MsgSpeed.h"
#include "communication_interface/test.h"
#include "LF/MsgDetect.h"



#define RF_MAX 32767

#define SERVO_MIN 280
#define SERVO_MAX 500
#define SERVO_AVER ((SERVO_MAX - SERVO_MIN) / 2) + SERVO_MIN
#define ANGLE_MAX 20
#define ANGLE_MIN -20

#define FULL_FORWARD 409
#define FULL_REVERSE 204
#define NEUTURAL 307


class motor
{
	public:
		motor(int servo, int esc);
		void pwmSet(int value);
		void subscribeMsg();
		void controller();
		void auto_controll();

	private:
		PCA9685 *pca9685 = new PCA9685();
		void msgCallback(const DF::MsgRF::ConstPtr &msg);
		void msgCallback_change(const DF::MsgMode::ConstPtr &msg);
		void msgCallback_auto(const DMF::MsgSpeed::ConstPtr &msg);
		void msgCallback_detect(const LF::MsgDetect::ConstPtr &msg);
		int get_pwm();
		int calculateServo(int value);
		int calculateServo_auto(int value);
		int calculateBLDC(int value, float gain);
		bool get_mode(bool ButA, bool ButB);
		int err;
		void run();
		void run2();
		int curServo;
		int curPWM;
		int servo;
		int bldc;
		bool mode_;
		int detect_;
		
		ros::NodeHandle n_;
		ros::Subscriber sub_;
		ros::Subscriber sub_change;
		ros::Subscriber sub_auto;
		ros::Subscriber sub_detect;
};
