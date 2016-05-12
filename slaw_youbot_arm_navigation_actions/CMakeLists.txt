cmake_minimum_required(VERSION 2.8.3)
project(slaw_youbot_arm_navigation_actions)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  actionlib
  actionlib_msgs
  message_generation
  slaw_youbot_arm_navigation_msgs
)

add_action_files(
  FILES
  MoveArmIK.action
  MoveArmLinear.action
 )


generate_messages(
    DEPENDENCIES
    actionlib_msgs
    geometry_msgs
    slaw_youbot_arm_navigation_msgs
    )

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES slaw_actions
   CATKIN_DEPENDS actionlib actionlib_msgs  message_runtime slaw_youbot_arm_navigation_msgs
#  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

