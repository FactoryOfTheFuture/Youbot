; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_msgs-msg)


;//! \htmlinclude ArmConfiguration.msg.html

(cl:defclass <ArmConfiguration> (roslisp-msg-protocol:ros-message)
  ((arm_joint_1
    :reader arm_joint_1
    :initarg :arm_joint_1
    :type cl:float
    :initform 0.0)
   (arm_joint_2
    :reader arm_joint_2
    :initarg :arm_joint_2
    :type cl:float
    :initform 0.0)
   (arm_joint_3
    :reader arm_joint_3
    :initarg :arm_joint_3
    :type cl:float
    :initform 0.0)
   (arm_joint_4
    :reader arm_joint_4
    :initarg :arm_joint_4
    :type cl:float
    :initform 0.0)
   (arm_joint_5
    :reader arm_joint_5
    :initarg :arm_joint_5
    :type cl:float
    :initform 0.0))
)

(cl:defclass ArmConfiguration (<ArmConfiguration>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArmConfiguration>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArmConfiguration)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_msgs-msg:<ArmConfiguration> is deprecated: use slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration instead.")))

(cl:ensure-generic-function 'arm_joint_1-val :lambda-list '(m))
(cl:defmethod arm_joint_1-val ((m <ArmConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_msgs-msg:arm_joint_1-val is deprecated.  Use slaw_youbot_arm_navigation_msgs-msg:arm_joint_1 instead.")
  (arm_joint_1 m))

(cl:ensure-generic-function 'arm_joint_2-val :lambda-list '(m))
(cl:defmethod arm_joint_2-val ((m <ArmConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_msgs-msg:arm_joint_2-val is deprecated.  Use slaw_youbot_arm_navigation_msgs-msg:arm_joint_2 instead.")
  (arm_joint_2 m))

(cl:ensure-generic-function 'arm_joint_3-val :lambda-list '(m))
(cl:defmethod arm_joint_3-val ((m <ArmConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_msgs-msg:arm_joint_3-val is deprecated.  Use slaw_youbot_arm_navigation_msgs-msg:arm_joint_3 instead.")
  (arm_joint_3 m))

(cl:ensure-generic-function 'arm_joint_4-val :lambda-list '(m))
(cl:defmethod arm_joint_4-val ((m <ArmConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_msgs-msg:arm_joint_4-val is deprecated.  Use slaw_youbot_arm_navigation_msgs-msg:arm_joint_4 instead.")
  (arm_joint_4 m))

(cl:ensure-generic-function 'arm_joint_5-val :lambda-list '(m))
(cl:defmethod arm_joint_5-val ((m <ArmConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_msgs-msg:arm_joint_5-val is deprecated.  Use slaw_youbot_arm_navigation_msgs-msg:arm_joint_5 instead.")
  (arm_joint_5 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArmConfiguration>) ostream)
  "Serializes a message object of type '<ArmConfiguration>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'arm_joint_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'arm_joint_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'arm_joint_3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'arm_joint_4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'arm_joint_5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArmConfiguration>) istream)
  "Deserializes a message object of type '<ArmConfiguration>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arm_joint_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arm_joint_2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arm_joint_3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arm_joint_4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arm_joint_5) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArmConfiguration>)))
  "Returns string type for a message object of type '<ArmConfiguration>"
  "slaw_youbot_arm_navigation_msgs/ArmConfiguration")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArmConfiguration)))
  "Returns string type for a message object of type 'ArmConfiguration"
  "slaw_youbot_arm_navigation_msgs/ArmConfiguration")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArmConfiguration>)))
  "Returns md5sum for a message object of type '<ArmConfiguration>"
  "4002ce9c0c27afe7b7ffe45719b55098")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArmConfiguration)))
  "Returns md5sum for a message object of type 'ArmConfiguration"
  "4002ce9c0c27afe7b7ffe45719b55098")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArmConfiguration>)))
  "Returns full string definition for message of type '<ArmConfiguration>"
  (cl:format cl:nil "float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArmConfiguration)))
  "Returns full string definition for message of type 'ArmConfiguration"
  (cl:format cl:nil "float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArmConfiguration>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArmConfiguration>))
  "Converts a ROS message object to a list"
  (cl:list 'ArmConfiguration
    (cl:cons ':arm_joint_1 (arm_joint_1 msg))
    (cl:cons ':arm_joint_2 (arm_joint_2 msg))
    (cl:cons ':arm_joint_3 (arm_joint_3 msg))
    (cl:cons ':arm_joint_4 (arm_joint_4 msg))
    (cl:cons ':arm_joint_5 (arm_joint_5 msg))
))
