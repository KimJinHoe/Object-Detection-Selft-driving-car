#include <nodelet/nodelet.h>
#include "communication_interface/connector.h"
#include <pluginlib/class_list_macros.h>

namespace nodelet_sample
{
class NodeletSampleNodelet : public nodelet::Nodelet
{
private:
        connector ns;
        connector client;

public:
        virtual void onInit()
        {
                ns.init(getNodeHandle(), getPrivateNodeHandle());
        }
}; // class NodeletSampleNodelet


}//namespace nodelet_sample

PLUGINLIB_EXPORT_CLASS(nodelet_sample::NodeletSampleNodelet, nodelet::Nodelet);

