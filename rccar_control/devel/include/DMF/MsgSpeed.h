// Generated by gencpp from file DMF/MsgSpeed.msg
// DO NOT EDIT!


#ifndef DMF_MESSAGE_MSGSPEED_H
#define DMF_MESSAGE_MSGSPEED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace DMF
{
template <class ContainerAllocator>
struct MsgSpeed_
{
  typedef MsgSpeed_<ContainerAllocator> Type;

  MsgSpeed_()
    : speed(0)
    , angle(0)
    , detect(0)  {
    }
  MsgSpeed_(const ContainerAllocator& _alloc)
    : speed(0)
    , angle(0)
    , detect(0)  {
  (void)_alloc;
    }



   typedef int32_t _speed_type;
  _speed_type speed;

   typedef int32_t _angle_type;
  _angle_type angle;

   typedef int32_t _detect_type;
  _detect_type detect;





  typedef boost::shared_ptr< ::DMF::MsgSpeed_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::DMF::MsgSpeed_<ContainerAllocator> const> ConstPtr;

}; // struct MsgSpeed_

typedef ::DMF::MsgSpeed_<std::allocator<void> > MsgSpeed;

typedef boost::shared_ptr< ::DMF::MsgSpeed > MsgSpeedPtr;
typedef boost::shared_ptr< ::DMF::MsgSpeed const> MsgSpeedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::DMF::MsgSpeed_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::DMF::MsgSpeed_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::DMF::MsgSpeed_<ContainerAllocator1> & lhs, const ::DMF::MsgSpeed_<ContainerAllocator2> & rhs)
{
  return lhs.speed == rhs.speed &&
    lhs.angle == rhs.angle &&
    lhs.detect == rhs.detect;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::DMF::MsgSpeed_<ContainerAllocator1> & lhs, const ::DMF::MsgSpeed_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace DMF

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::DMF::MsgSpeed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::DMF::MsgSpeed_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::DMF::MsgSpeed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::DMF::MsgSpeed_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::DMF::MsgSpeed_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::DMF::MsgSpeed_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::DMF::MsgSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "853e99bee3ef2ccbccc03b9c8c648993";
  }

  static const char* value(const ::DMF::MsgSpeed_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x853e99bee3ef2ccbULL;
  static const uint64_t static_value2 = 0xccc03b9c8c648993ULL;
};

template<class ContainerAllocator>
struct DataType< ::DMF::MsgSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "DMF/MsgSpeed";
  }

  static const char* value(const ::DMF::MsgSpeed_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::DMF::MsgSpeed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 speed\n"
"int32 angle\n"
"int32 detect\n"
;
  }

  static const char* value(const ::DMF::MsgSpeed_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::DMF::MsgSpeed_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.speed);
      stream.next(m.angle);
      stream.next(m.detect);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MsgSpeed_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::DMF::MsgSpeed_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::DMF::MsgSpeed_<ContainerAllocator>& v)
  {
    s << indent << "speed: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed);
    s << indent << "angle: ";
    Printer<int32_t>::stream(s, indent + "  ", v.angle);
    s << indent << "detect: ";
    Printer<int32_t>::stream(s, indent + "  ", v.detect);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DMF_MESSAGE_MSGSPEED_H
