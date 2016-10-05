# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "slaw_youbot_arm_navigation_srvs: 0 messages, 6 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Islaw_youbot_arm_navigation_msgs:/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(slaw_youbot_arm_navigation_srvs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv" NAME_WE)
add_custom_target(_slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slaw_youbot_arm_navigation_srvs" "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv" "geometry_msgs/Point:geometry_msgs/PointStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv" NAME_WE)
add_custom_target(_slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slaw_youbot_arm_navigation_srvs" "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv" "slaw_youbot_arm_navigation_msgs/ArmConfiguration"
)

get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv" NAME_WE)
add_custom_target(_slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slaw_youbot_arm_navigation_srvs" "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv" "slaw_youbot_arm_navigation_msgs/EndeffectorPosition:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv" NAME_WE)
add_custom_target(_slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slaw_youbot_arm_navigation_srvs" "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv" "slaw_youbot_arm_navigation_msgs/ArmConfiguration"
)

get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv" NAME_WE)
add_custom_target(_slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slaw_youbot_arm_navigation_srvs" "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv" NAME_WE)
add_custom_target(_slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slaw_youbot_arm_navigation_srvs" "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_cpp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/ArmConfiguration.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_cpp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/EndeffectorPosition.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_cpp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_cpp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_cpp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/ArmConfiguration.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)

### Generating Module File
_generate_module_cpp(slaw_youbot_arm_navigation_srvs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(slaw_youbot_arm_navigation_srvs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages slaw_youbot_arm_navigation_srvs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slaw_youbot_arm_navigation_srvs_gencpp)
add_dependencies(slaw_youbot_arm_navigation_srvs_gencpp slaw_youbot_arm_navigation_srvs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slaw_youbot_arm_navigation_srvs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_lisp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/ArmConfiguration.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_lisp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/EndeffectorPosition.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_lisp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_lisp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_lisp(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/ArmConfiguration.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)

### Generating Module File
_generate_module_lisp(slaw_youbot_arm_navigation_srvs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(slaw_youbot_arm_navigation_srvs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages slaw_youbot_arm_navigation_srvs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slaw_youbot_arm_navigation_srvs_genlisp)
add_dependencies(slaw_youbot_arm_navigation_srvs_genlisp slaw_youbot_arm_navigation_srvs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slaw_youbot_arm_navigation_srvs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_py(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/ArmConfiguration.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_py(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/EndeffectorPosition.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_py(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_py(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)
_generate_srv_py(slaw_youbot_arm_navigation_srvs
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv"
  "${MSG_I_FLAGS}"
  "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_msgs/msg/ArmConfiguration.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
)

### Generating Module File
_generate_module_py(slaw_youbot_arm_navigation_srvs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(slaw_youbot_arm_navigation_srvs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages slaw_youbot_arm_navigation_srvs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SimpleIkSolver.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArm.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmLinear.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveJoints.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/MoveArmIK.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ruud/youBot/src/slaw_youbot_arm_navigation/slaw_youbot_arm_navigation_srvs/srv/SetSide.srv" NAME_WE)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py _slaw_youbot_arm_navigation_srvs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slaw_youbot_arm_navigation_srvs_genpy)
add_dependencies(slaw_youbot_arm_navigation_srvs_genpy slaw_youbot_arm_navigation_srvs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slaw_youbot_arm_navigation_srvs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_cpp slaw_youbot_arm_navigation_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_lisp slaw_youbot_arm_navigation_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slaw_youbot_arm_navigation_srvs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(slaw_youbot_arm_navigation_srvs_generate_messages_py slaw_youbot_arm_navigation_msgs_generate_messages_py)
