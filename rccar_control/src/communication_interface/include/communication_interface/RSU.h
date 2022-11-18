#ifndef __RSU__
#define __RSU__
struct ObjectHeader{   //Header Á¤ÀÇ
   int         DataType;   //Vehicle 0, Road 1
   int         DataLength;   //º¸³»´Â µ¥ÀÌÅÍ »çÀÌÁî (Header Á¦¿Ü)
};

struct vehicle_data
{
	double lati;
	double longi;
};

struct RecvDataVehicle
{
	struct ObjectHeader	header;
	int				ID;
	double			curLongitudeGpsInfo;	
	double			curLatitudeGpsInfo;		
	double			direction;				
	int				nCurSpeed;				
	int				nCurLane;				
	double			destLongitudeGpsInfo;	
	double			destLatitudeGpsInfo;	
	char			savedTime[24];			
	double			dFrontLidarInfo;		
	double			dLeftLidarInfo;			
	double			dRightLidarInfo;		
	double			dRearLidarInfo;			
};


struct SendEventDataVehicle
{   
   ObjectHeader   header;
   int            ID;
   int            eventType;            
   int            direction;            
   char         stop;               
   double         speed;              
};

struct test
{
	int ID;
	int speed;
};

#endif
