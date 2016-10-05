cmake_minimum_required(VERSION 2.8.3)
project(slaw_youbot_arm_navigation_msgs)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  message_generation
  std_msgs
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  ArmConfiguration.msg
  EndeffectorPosition.msg
  )

## Generate added messages and services with any dependencies listed here
generate_messages(
   DEPENDENCIES
   geometry_msgs
   std_msgs
 )

catkin_package(
   CATKIN_DEPENDS
   geometry_msgs
   message_runtime
   std_msgs
)

# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

