; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_srvs-srv)


;//! \htmlinclude MoveJoints-request.msg.html

(cl:defclass <MoveJoints-request> (roslisp-msg-protocol:ros-message)
  ((configuration
    :reader configuration
    :initarg :configuration
    :type slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration
    :initform (cl:make-instance 'slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration))
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

(cl:defclass MoveJoints-request (<MoveJoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveJoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveJoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<MoveJoints-request> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:MoveJoints-request instead.")))

(cl:ensure-generic-function 'configuration-val :lambda-list '(m))
(cl:defmethod configuration-val ((m <MoveJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:configuration-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:configuration instead.")
  (configuration m))

(cl:ensure-generic-function 'blocking-val :lambda-list '(m))
(cl:defmethod blocking-val ((m <MoveJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:blocking-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:blocking instead.")
  (blocking m))

(cl:ensure-generic-function 'velocity_controlled-val :lambda-list '(m))
(cl:defmethod velocity_controlled-val ((m <MoveJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:velocity_controlled-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:velocity_controlled instead.")
  (velocity_controlled m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <MoveJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:max_speed-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:max_speed instead.")
  (max_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveJoints-request>) ostream)
  "Serializes a message object of type '<MoveJoints-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'configuration) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blocking) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'velocity_controlled) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveJoints-request>) istream)
  "Deserializes a message object of type '<MoveJoints-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'configuration) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveJoints-request>)))
  "Returns string type for a service object of type '<MoveJoints-request>"
  "slaw_youbot_arm_navigation_srvs/MoveJointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveJoints-request)))
  "Returns string type for a service object of type 'MoveJoints-request"
  "slaw_youbot_arm_navigation_srvs/MoveJointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveJoints-request>)))
  "Returns md5sum for a message object of type '<MoveJoints-request>"
  "d07079461c3693f01c6c76f81e4c199e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveJoints-request)))
  "Returns md5sum for a message object of type 'MoveJoints-request"
  "d07079461c3693f01c6c76f81e4c199e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveJoints-request>)))
  "Returns full string definition for message of type '<MoveJoints-request>"
  (cl:format cl:nil "slaw_youbot_arm_navigation_msgs/ArmConfiguration configuration~%bool blocking~%bool velocity_controlled~%float32 max_speed~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/ArmConfiguration~%float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveJoints-request)))
  "Returns full string definition for message of type 'MoveJoints-request"
  (cl:format cl:nil "slaw_youbot_arm_navigation_msgs/ArmConfiguration configuration~%bool blocking~%bool velocity_controlled~%float32 max_speed~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/ArmConfiguration~%float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveJoints-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'configuration))
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveJoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveJoints-request
    (cl:cons ':configuration (configuration msg))
    (cl:cons ':blocking (blocking msg))
    (cl:cons ':velocity_controlled (velocity_controlled msg))
    (cl:cons ':max_speed (max_speed msg))
))
;//! \htmlinclude MoveJoints-response.msg.html

(cl:defclass <MoveJoints-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (reason
    :reader reason
    :initarg :reason
    :type cl:string
    :initform ""))
)

(cl:defclass MoveJoints-response (<MoveJoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveJoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveJoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<MoveJoints-response> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:MoveJoints-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:success-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <MoveJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:reason-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:reason instead.")
  (reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveJoints-response>) ostream)
  "Serializes a message object of type '<MoveJoints-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveJoints-response>) istream)
  "Deserializes a message object of type '<MoveJoints-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveJoints-response>)))
  "Returns string type for a service object of type '<MoveJoints-response>"
  "slaw_youbot_arm_navigation_srvs/MoveJointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveJoints-response)))
  "Returns string type for a service object of type 'MoveJoints-response"
  "slaw_youbot_arm_navigation_srvs/MoveJointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveJoints-response>)))
  "Returns md5sum for a message object of type '<MoveJoints-response>"
  "d07079461c3693f01c6c76f81e4c199e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveJoints-response)))
  "Returns md5sum for a message object of type 'MoveJoints-response"
  "d07079461c3693f01c6c76f81e4c199e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveJoints-response>)))
  "Returns full string definition for message of type '<MoveJoints-response>"
  (cl:format cl:nil "bool success~%string reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveJoints-response)))
  "Returns full string definition for message of type 'MoveJoints-response"
  (cl:format cl:nil "bool success~%string reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveJoints-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveJoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveJoints-response
    (cl:cons ':success (success msg))
    (cl:cons ':reason (reason msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveJoints)))
  'MoveJoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveJoints)))
  'MoveJoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveJoints)))
  "Returns string type for a service object of type '<MoveJoints>"
  "slaw_youbot_arm_navigation_srvs/MoveJoints")