# Install script for directory: /home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_srvs/srv" TYPE FILE FILES
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv"
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv"
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv"
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv"
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv"
    "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_srvs/cmake" TYPE FILE FILES "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/catkin_generated/installspace/slaw_youbot_arm_navigation_srvs-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ruud/youBot/devel/include/slaw_youbot_arm_navigation_srvs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ruud/youBot/devel/share/common-lisp/ros/slaw_youbot_arm_navigation_srvs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/ruud/youBot/devel/lib/python2.7/dist-packages/slaw_youbot_arm_navigation_srvs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ruud/youBot/devel/lib/python2.7/dist-packages/slaw_youbot_arm_navigation_srvs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/catkin_generated/installspace/slaw_youbot_arm_navigation_srvs.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_srvs/cmake" TYPE FILE FILES "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/catkin_generated/installspace/slaw_youbot_arm_navigation_srvs-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_srvs/cmake" TYPE FILE FILES
    "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/catkin_generated/installspace/slaw_youbot_arm_navigation_srvsConfig.cmake"
    "/home/ruud/youBot/build/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/catkin_generated/installspace/slaw_youbot_arm_navigation_srvsConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slaw_youbot_arm_navigation_srvs" TYPE FILE FILES "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

