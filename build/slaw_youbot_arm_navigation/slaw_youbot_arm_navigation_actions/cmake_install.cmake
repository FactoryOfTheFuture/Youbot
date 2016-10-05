# Install script for directory: /home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/ruud/youBot/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions/action" TYPE FILE FILES
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/action/MoveArmIK.action"
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/action/MoveArmLinear.action"
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/action/VelocityControlledJointTrajectory.action"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions/msg" TYPE FILE FILES
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmIKAction.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmIKActionGoal.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmIKActionResult.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmIKActionFeedback.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmIKGoal.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmIKResult.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmIKFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions/msg" TYPE FILE FILES
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmLinearAction.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmLinearActionGoal.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmLinearActionResult.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmLinearActionFeedback.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmLinearGoal.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmLinearResult.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/MoveArmLinearFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions/msg" TYPE FILE FILES
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/VelocityControlledJointTrajectoryAction.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/VelocityControlledJointTrajectoryActionGoal.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/VelocityControlledJointTrajectoryActionResult.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/VelocityControlledJointTrajectoryActionFeedback.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/VelocityControlledJointTrajectoryGoal.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/VelocityControlledJointTrajectoryResult.msg"
    "/home/ruud/youBot/devel/share/slaw_youbot_arm_navigation_actions/msg/VelocityControlledJointTrajectoryFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions/cmake" TYPE FILE FILES "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/catkin_generated/installspace/slaw_youbot_arm_navigation_actions-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ruud/youBot/devel/include/slaw_youbot_arm_navigation_actions")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ruud/youBot/devel/share/common-lisp/ros/slaw_youbot_arm_navigation_actions")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/ruud/youBot/devel/lib/python2.7/dist-packages/slaw_youbot_arm_navigation_actions")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ruud/youBot/devel/lib/python2.7/dist-packages/slaw_youbot_arm_navigation_actions")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/catkin_generated/installspace/slaw_youbot_arm_navigation_actions.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions/cmake" TYPE FILE FILES "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/catkin_generated/installspace/slaw_youbot_arm_navigation_actions-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions/cmake" TYPE FILE FILES
    "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/catkin_generated/installspace/slaw_youbot_arm_navigation_actionsConfig.cmake"
    "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/catkin_generated/installspace/slaw_youbot_arm_navigation_actionsConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_actions" TYPE FILE FILES "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_actions/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

