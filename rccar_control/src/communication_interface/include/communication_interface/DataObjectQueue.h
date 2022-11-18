#ifndef __DATAOBJECTQUEUE__
#define __DATAOBJECTQUEUE__
#include <queue>
#include "RSU.h"
#define MAX_SEM_CNT 1

class DataObjectQueue
{
private:
	
	std::queue<struct RecvDataVehicle> dataQueue;
	struct RecvDataVehicle return_struct;
public:
	DataObjectQueue();
	~DataObjectQueue();
	void put(struct RecvDataVehicle dataObject);
	struct RecvDataVehicle get();
	
	bool IsQueueEmpty();

	//DataCommObject returnObj;

	
};

#endif
