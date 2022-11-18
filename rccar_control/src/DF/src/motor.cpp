#include "DF/motor.h"
#include "communication_interface/test.h"
#include "DMF/MsgSpeed.h"

motor::motor(int servo, int bldc)
{
	this->servo = servo;
	this->bldc = bldc;
        mode_= 0;
        detect_ = 0;
	err = pca9685->openPCA9685();
	curServo = SERVO_AVER;
	curPWM = NEUTURAL;

	if (err < 0)
	{
		printf("Error: %d", pca9685->error);
	} 
	else 
	{
		printf("PCA9685 Device Address: 0x%02X\n",pca9685->kI2CAddress) ;
		pca9685->setAllPWM(0,0) ;
		pca9685->reset() ;	
                pca9685->setPWMFrequency(60) ;
        }

	std::thread mThread(&motor::run, this);
        //std::thread mThread2(&motor::run2, this);
	mThread.detach();
        //mThread2.detach();

}

void motor::run()
{
	while(pca9685->error >= 0)
	{
		pca9685->setPWM(servo,0,curServo) ;
		pca9685->setPWM(bldc,0,curPWM) ;
	}
}

void motor::run2()
{
    while(pca9685->error >= 0)
    {
        curPWM = get_pwm();
    }
}

void motor::pwmSet(int value)
{
	curPWM = value;
}

int motor::calculateBLDC(int value, float gain)
{
	int result = -float(value) / float(RF_MAX) * float(FULL_FORWARD - FULL_REVERSE) / 2 * gain + NEUTURAL;
	return result;
}

int motor::calculateServo(int value)
{
	int result = float(RF_MAX + value) / float(RF_MAX * 2) * float(SERVO_MAX - SERVO_MIN) + SERVO_MIN;
	return result;
}

int motor::calculateServo_auto(int value)
{
        int result = float(ANGLE_MAX + (value * 0.2)) / float(ANGLE_MAX * 2) * float(SERVO_MAX - SERVO_MIN) + SERVO_MIN;
        //ROS_INFO("angle input: %d", result);
        return result;
}

void motor::msgCallback(const DF::MsgRF::ConstPtr &msg)
{
        ROS_INFO("X: %d, Servo: %d", msg->axis_x, calculateServo(msg->axis_x));
	curServo = calculateServo(msg->axis_x);
	if(abs(msg->axis_y) > 10)
	{
		curPWM = calculateBLDC(msg->axis_y, 0.18);
                ROS_INFO("Y: %d, BLDC: %d", msg->axis_y, calculateBLDC(msg->axis_y, 0.18));
	}
	else if(abs(msg->axis_setMode) > 10)
	{
		curPWM = calculateBLDC(msg->axis_setMode, 1);
                //ROS_INFO("Set: %d, value: %d", msg->axis_setMode, calculateBLDC(msg->axis_setMode, 0.5));
	}
	else
	{
                curPWM = calculateBLDC(307, 1);
                //ROS_INFO("Set Neutural: %d", curPWM = calculateBLDC(307, 1));
	}
}

int motor::get_pwm()
{
    struct timeval time_now{};
    int flag;
    int speed;
    gettimeofday(&time_now, nullptr);
    time_t prev_time =  (time_now.tv_sec * 1000000) + (time_now.tv_usec);
    while(mode_ == 1)
    {
        printf("flag : %d\n", flag);
        gettimeofday(&time_now, nullptr);
        time_t now_time =  (time_now.tv_sec * 1000000) + (time_now.tv_usec);


        if(now_time - prev_time > 50000)
        {
            if(flag == 0)
            {
                speed = 320;
                flag++;
            }
            else if(flag == 1)
            {
                speed = 320;
                flag++;
            }
            else
            {
             speed = 0;
                flag = 0;
            }
        }
        return speed;
        printf("speed : %d", speed);
    }
}


void motor::msgCallback_auto(const DMF::MsgSpeed::ConstPtr &msg)
{
    detect_ = msg->detect;
    //ROS_INFO("detect : %d", msg->detect);
    if(detect_ == 0)
    {
       curServo = calculateServo_auto(msg->angle);
       curPWM = calculateBLDC(msg->speed, 0.18);
	ROS_INFO("speed : %d", msg->speed);	
    }
    else if(detect_ == 1 || detect_ == 5)
    {
         curPWM = calculateBLDC(msg->speed, 0.18);
        //printf("speed : ")
        //sub_auto.shutdown();
    }
    else if(detect_ == 2)
    {
	curServo = calculateServo_auto(msg->angle);
	curPWM = calculateBLDC(msg->speed, 0.18);
	ROS_INFO("speed : %d", msg->speed);
    }
    else if(detect_ == 3)
    {
	curPWM = calculateBLDC(msg->speed, 0.18);
	curServo = 280;
    }
}

void motor::msgCallback_detect(const LF::MsgDetect::ConstPtr &msg)
{
    int detect = msg->detect;
    if(detect == 0) detect_ = 0;
    else if(detect == 1) detect_ = 1;
    ROS_INFO(" detect : %d", detect_);
    if(detect_ == 0)
    {
        sub_auto=n_.subscribe("data_speed", 100, &motor::msgCallback_auto, this);

    }
    else if(detect_ == 1)
    {
        curPWM = 0;
        //printf("speed : ")
        sub_auto.shutdown();
    }
    else if(detect_ == 2)
    {
	curPWM = 370;
	sub_auto.shutdown();
    }


}
void motor::msgCallback_change(const DF::MsgMode::ConstPtr &msg)
{
    bool buttonA = msg->modeA;
    bool buttonB = msg->modeB;
    if(buttonA == 1) mode_ = 0;
    else if(buttonB == 1) mode_ = 1;
    //mode_ = get_mode(buttonA, buttonB);

    //ROS_INFO("buttonA : %d buttonB : %d", buttonA, buttonB);
    //printf("mode : %d", mode_);

    if(mode_ == 0)
    {
        sub_=n_.subscribe("msg_rf", 100, &motor::msgCallback, this);
        sub_auto.shutdown();
        //sub_detect.shutdown();
    }
    else if(mode_ == 1)
    {
	sub_auto=n_.subscribe("data_speed", 100, &motor::msgCallback_auto, this);
        //sub_detect=n_.subscribe("data_detect", 100, &motor::msgCallback_detect, this);
        sub_.shutdown();
    }

}
/*
bool motor::get_mode(bool ButA, bool ButB)
{
    bool mode;
        if(ButA == 1)
            mode = 0;
        //printf("mode1 = %d", mode);
                return mode;
        if(ButB == 1)
            mode = 1;
        printf("mode1 = %d", mode);
                return mode;

}
*/
void motor::subscribeMsg()
{
    sub_change=n_.subscribe("msg_mode", 100, &motor::msgCallback_change, this);
    printf("mode : %d", mode_);
    /*
    if(mode_ == 0)
    {
        sub_=n_.subscribe("msg_rf", 100, &motor::msgCallback, this);
    }
    else if(mode_ == 1)
    {
        sub_auto=n_.subscribe("msg_speed", 100, &motor::msgCallback_auto, this);
    }
    */


}
/*
void motor::controller()
{
     sub_=n_.subscribe("msg_rf", 100, &motor::msgCallback, this);

}

void motor::auto_controll()
{
    sub_auto=n_.subscribe("msg_speed", 100, &motor::msgCallback_auto, this);
}
*/
