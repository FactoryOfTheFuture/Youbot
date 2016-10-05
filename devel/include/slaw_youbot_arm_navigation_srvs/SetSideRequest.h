// Generated by gencpp from file slaw_youbot_arm_navigation_srvs/SetSideRequest.msg
// DO NOT EDIT!


#ifndef SLAW_YOUBOT_ARM_NAVIGATION_SRVS_MESSAGE_SETSIDEREQUEST_H
#define SLAW_YOUBOT_ARM_NAVIGATION_SRVS_MESSAGE_SETSIDEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace slaw_youbot_arm_navigation_srvs
{
template <class ContainerAllocator>
struct SetSideRequest_
{
  typedef SetSideRequest_<ContainerAllocator> Type;

  SetSideRequest_()
    : side()
    , horizontal(false)  {
    }
  SetSideRequest_(const ContainerAllocator& _alloc)
    : side(_alloc)
    , horizontal(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _side_type;
  _side_type side;

   typedef uint8_t _horizontal_type;
  _horizontal_type horizontal;




  typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetSideRequest_

typedef ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<std::allocator<void> > SetSideRequest;

typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::SetSideRequest > SetSideRequestPtr;
typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::SetSideRequest const> SetSideRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace slaw_youbot_arm_navigation_srvs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'slaw_youbot_arm_navigation_msgs': ['/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d4644e7065ac56f1bb0fd20c1570f472";
  }

  static const char* value(const ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd4644e7065ac56f1ULL;
  static const uint64_t static_value2 = 0xbb0fd20c1570f472ULL;
};

template<class ContainerAllocator>
struct DataType< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "slaw_youbot_arm_navigation_srvs/SetSideRequest";
  }

  static const char* value(const ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string side\n\
bool horizontal\n\
";
  }

  static const char* value(const ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.side);
      stream.next(m.horizontal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetSideRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::slaw_youbot_arm_navigation_srvs::SetSideRequest_<ContainerAllocator>& v)
  {
    s << indent << "side: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.side);
    s << indent << "horizontal: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.horizontal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SLAW_YOUBOT_ARM_NAVIGATION_SRVS_MESSAGE_SETSIDEREQUEST_H