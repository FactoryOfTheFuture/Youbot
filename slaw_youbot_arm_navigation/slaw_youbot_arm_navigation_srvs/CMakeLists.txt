cmake_minimum_required(VERSION 2.8.3)
project(slaw_youbot_arm_navigation_srvs)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  slaw_youbot_arm_navigation_msgs
  message_generation
  std_msgs
)

## Generate services in the 'srv' folder
add_service_files(
   FILES
   MoveArm.srv
   MoveArmIK.srv
   MoveArmLinear.srv
   MoveJoints.srv
   SetSide.srv
   SimpleIkSolver.srv
)


## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   geometry_msgs
   slaw_youbot_arm_navigation_msgs
 )


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES slaw_srvs
   CATKIN_DEPENDS geometry_msgs slaw_youbot_arm_navigation_msgs message_runtime std_msgs
#  DEPENDS system_lib
)

# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)
