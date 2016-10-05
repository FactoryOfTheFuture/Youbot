execute_process(COMMAND "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_utils/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_utils/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
