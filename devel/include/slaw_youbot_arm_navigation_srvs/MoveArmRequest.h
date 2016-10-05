// Generated by gencpp from file slaw_youbot_arm_navigation_srvs/MoveArmRequest.msg
// DO NOT EDIT!


#ifndef SLAW_YOUBOT_ARM_NAVIGATION_SRVS_MESSAGE_MOVEARMREQUEST_H
#define SLAW_YOUBOT_ARM_NAVIGATION_SRVS_MESSAGE_MOVEARMREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <slaw_youbot_arm_navigation_msgs/ArmConfiguration.h>

namespace slaw_youbot_arm_navigation_srvs
{
template <class ContainerAllocator>
struct MoveArmRequest_
{
  typedef MoveArmRequest_<ContainerAllocator> Type;

  MoveArmRequest_()
    : configurations()
    , blocking(false)
    , velocity_controlled(false)
    , max_speed(0.0)  {
    }
  MoveArmRequest_(const ContainerAllocator& _alloc)
    : configurations(_alloc)
    , blocking(false)
    , velocity_controlled(false)
    , max_speed(0.0)  {
  (void)_alloc;
    }



   typedef std::vector< ::slaw_youbot_arm_navigation_msgs::ArmConfiguration_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::slaw_youbot_arm_navigation_msgs::ArmConfiguration_<ContainerAllocator> >::other >  _configurations_type;
  _configurations_type configurations;

   typedef uint8_t _blocking_type;
  _blocking_type blocking;

   typedef uint8_t _velocity_controlled_type;
  _velocity_controlled_type velocity_controlled;

   typedef float _max_speed_type;
  _max_speed_type max_speed;




  typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MoveArmRequest_

typedef ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<std::allocator<void> > MoveArmRequest;

typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest > MoveArmRequestPtr;
typedef boost::shared_ptr< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest const> MoveArmRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2199525abf3db44c8bf0336a39789c90";
  }

  static const char* value(const ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2199525abf3db44cULL;
  static const uint64_t static_value2 = 0x8bf0336a39789c90ULL;
};

template<class ContainerAllocator>
struct DataType< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "slaw_youbot_arm_navigation_srvs/MoveArmRequest";
  }

  static const char* value(const ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "slaw_youbot_arm_navigation_msgs/ArmConfiguration[] configurations\n\
bool blocking\n\
bool velocity_controlled\n\
float32 max_speed\n\
\n\
================================================================================\n\
MSG: slaw_youbot_arm_navigation_msgs/ArmConfiguration\n\
float32 arm_joint_1\n\
float32 arm_joint_2\n\
float32 arm_joint_3\n\
float32 arm_joint_4\n\
float32 arm_joint_5\n\
";
  }

  static const char* value(const ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.configurations);
      stream.next(m.blocking);
      stream.next(m.velocity_controlled);
      stream.next(m.max_speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveArmRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::slaw_youbot_arm_navigation_srvs::MoveArmRequest_<ContainerAllocator>& v)
  {
    s << indent << "configurations[]" << std::endl;
    for (size_t i = 0; i < v.configurations.size(); ++i)
    {
      s << indent << "  configurations[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::slaw_youbot_arm_navigation_msgs::ArmConfiguration_<ContainerAllocator> >::stream(s, indent + "    ", v.configurations[i]);
    }
    s << indent << "blocking: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.blocking);
    s << indent << "velocity_controlled: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.velocity_controlled);
    s << indent << "max_speed: ";
    Printer<float>::stream(s, indent + "  ", v.max_speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SLAW_YOUBOT_ARM_NAVIGATION_SRVS_MESSAGE_MOVEARMREQUEST_H