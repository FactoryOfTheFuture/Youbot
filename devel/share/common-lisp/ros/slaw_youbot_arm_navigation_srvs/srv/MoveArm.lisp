; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_srvs-srv)


;//! \htmlinclude MoveArm-request.msg.html

(cl:defclass <MoveArm-request> (roslisp-msg-protocol:ros-message)
  ((configurations
    :reader configurations
    :initarg :configurations
    :type (cl:vector slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration)
   :initform (cl:make-array 0 :element-type 'slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration :initial-element (cl:make-instance 'slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration)))
   (blocking
    :reader blocking
    :initarg :blocking
    :type cl:boolean
    :initform cl:nil)
   (velocity_controlled
    :reader velocity_controlled
    :initarg :velocity_controlled
    :type cl:boolean
    :initform cl:nil)
   (max_speed
    :reader max_speed
    :initarg :max_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveArm-request (<MoveArm-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveArm-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveArm-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<MoveArm-request> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:MoveArm-request instead.")))

(cl:ensure-generic-function 'configurations-val :lambda-list '(m))
(cl:defmethod configurations-val ((m <MoveArm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:configurations-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:configurations instead.")
  (configurations m))

(cl:ensure-generic-function 'blocking-val :lambda-list '(m))
(cl:defmethod blocking-val ((m <MoveArm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:blocking-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:blocking instead.")
  (blocking m))

(cl:ensure-generic-function 'velocity_controlled-val :lambda-list '(m))
(cl:defmethod velocity_controlled-val ((m <MoveArm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:velocity_controlled-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:velocity_controlled instead.")
  (velocity_controlled m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <MoveArm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:max_speed-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:max_speed instead.")
  (max_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveArm-request>) ostream)
  "Serializes a message object of type '<MoveArm-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'configurations))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'configurations))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blocking) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'velocity_controlled) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveArm-request>) istream)
  "Deserializes a message object of type '<MoveArm-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'configurations) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'configurations)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'blocking) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'velocity_controlled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveArm-request>)))
  "Returns string type for a service object of type '<MoveArm-request>"
  "slaw_youbot_arm_navigation_srvs/MoveArmRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArm-request)))
  "Returns string type for a service object of type 'MoveArm-request"
  "slaw_youbot_arm_navigation_srvs/MoveArmRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveArm-request>)))
  "Returns md5sum for a message object of type '<MoveArm-request>"
  "9f106f1e1533bc6bfe2e5855c5cd2307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveArm-request)))
  "Returns md5sum for a message object of type 'MoveArm-request"
  "9f106f1e1533bc6bfe2e5855c5cd2307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveArm-request>)))
  "Returns full string definition for message of type '<MoveArm-request>"
  (cl:format cl:nil "slaw_youbot_arm_navigation_msgs/ArmConfiguration[] configurations~%bool blocking~%bool velocity_controlled~%float32 max_speed~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/ArmConfiguration~%float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveArm-request)))
  "Returns full string definition for message of type 'MoveArm-request"
  (cl:format cl:nil "slaw_youbot_arm_navigation_msgs/ArmConfiguration[] configurations~%bool blocking~%bool velocity_controlled~%float32 max_speed~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/ArmConfiguration~%float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveArm-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'configurations) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveArm-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveArm-request
    (cl:cons ':configurations (configurations msg))
    (cl:cons ':blocking (blocking msg))
    (cl:cons ':velocity_controlled (velocity_controlled msg))
    (cl:cons ':max_speed (max_speed msg))
))
;//! \htmlinclude MoveArm-response.msg.html

(cl:defclass <MoveArm-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveArm-response (<MoveArm-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveArm-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveArm-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<MoveArm-response> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:MoveArm-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveArm-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:success-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveArm-response>) ostream)
  "Serializes a message object of type '<MoveArm-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveArm-response>) istream)
  "Deserializes a message object of type '<MoveArm-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveArm-response>)))
  "Returns string type for a service object of type '<MoveArm-response>"
  "slaw_youbot_arm_navigation_srvs/MoveArmResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArm-response)))
  "Returns string type for a service object of type 'MoveArm-response"
  "slaw_youbot_arm_navigation_srvs/MoveArmResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveArm-response>)))
  "Returns md5sum for a message object of type '<MoveArm-response>"
  "9f106f1e1533bc6bfe2e5855c5cd2307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveArm-response)))
  "Returns md5sum for a message object of type 'MoveArm-response"
  "9f106f1e1533bc6bfe2e5855c5cd2307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveArm-response>)))
  "Returns full string definition for message of type '<MoveArm-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveArm-response)))
  "Returns full string definition for message of type 'MoveArm-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveArm-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveArm-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveArm-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveArm)))
  'MoveArm-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveArm)))
  'MoveArm-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArm)))
  "Returns string type for a service object of type '<MoveArm>"
  "slaw_youbot_arm_navigation_srvs/MoveArm")