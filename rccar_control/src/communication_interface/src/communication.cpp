#include "communication_interface/udp.h"
#include "communication_interface/connector.h"
#include "communication_interface/test.h"
#include "ros/ros.h"


typedef struct {	//Header Á¤ÀÇ
	int	DataType;	//Vehicle 0, Road 1
	int	DataLength;	//º¸³»´Â µ¥ÀÌÅÍ »çÀÌÁî (Header Á¦¿Ü)
}ObjectHeader;

typedef struct{	//Â÷·®¿¡¼­ ÁÖ±âÀûÀ¸·Î ¹Þ´Â µ¥ÀÌÅÍ Á¤ÀÇ
	ObjectHeader	header;
	int	ID;
	double	curLongitudeGpsInfo;	//°æµµ
	double	curLatitudeGpsInfo;		//À§µµ
	double	direction;				//Direction
	int	nCurSpeed;				//ÇöÀç Â÷·®ÀÇ ¼Óµµ
	int	nCurLane;				//ÇöÀç ¿îÇà Â÷¼± Á¤º¸
	double	destLongitudeGpsInfo;	//°æµµ
	double	destLatitudeGpsInfo;	//À§µµ
	char	savedTime[24];			//Â÷·®¿¡¼­ º¸³½ ¸Þ½ÃÁö¸¦ ÀúÀåÇÏ´Â ½Ã°£	2021-03-31 12:12:12:999
	double	dFrontLidarInfo;		//Â÷·®¿¡¼­ ¹ÞÀº ¶óÀÌ´õ Á¤º¸
	double	dLeftLidarInfo;			//Â÷·®¿¡¼­ ¹ÞÀº ¶óÀÌ´õ Á¤º¸
	double	dRightLidarInfo;		//Â÷·®¿¡¼­ ¹ÞÀº ¶óÀÌ´õ Á¤º¸
	double	dRearLidarInfo;			//Â÷·®¿¡¼­ ¹ÞÀº ¶óÀÌ´õ Á¤º¸
}RecvDataVehicle;

int main()int argc, char **argv)
{
	udp udp_sender(1, "127.0.0.1", 9999);
	connector speed(&udp_sender);
}


