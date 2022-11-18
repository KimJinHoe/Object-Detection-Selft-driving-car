#include "communication_interface/DataObjectQueue.h"
#include "communication_interface/udp.h"

DataObjectQueue::DataObjectQueue()
{
}

DataObjectQueue::~DataObjectQueue()
{
}

void DataObjectQueue::put(struct RecvDataVehicle dataObject)
{
        dataQueue.push(dataObject);
        printf("pushed\n");
}

struct RecvDataVehicle DataObjectQueue::get()
{
        return_struct = dataQueue.front();
	dataQueue.pop();
        printf("poped\n");
        return return_struct;
}

bool DataObjectQueue::IsQueueEmpty() // lly 0428 À¸¾Ç!
{
	return dataQueue.empty(); //dissatisfy thread-safety...
}


