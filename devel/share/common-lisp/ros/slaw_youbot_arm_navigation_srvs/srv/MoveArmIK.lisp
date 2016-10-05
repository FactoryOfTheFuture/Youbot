; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_srvs-srv)


;//! \htmlinclude MoveArmIK-request.msg.html

(cl:defclass <MoveArmIK-request> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (velocity_controlled
    :reader velocity_controlled
    :initarg :velocity_controlled
    :type cl:boolean
    :initform cl:nil)
   (side
    :reader side
    :initarg :side
    :type cl:string
    :initform "")
   (endlink_angle
    :reader endlink_angle
    :initarg :endlink_angle
    :type cl:float
    :initform 0.0)
   (horizontal
    :reader horizontal
    :initarg :horizontal
    :type cl:boolean
    :initform cl:nil)
   (blocking
    :reader blocking
    :initarg :blocking
    :type cl:boolean
    :initform cl:nil)
   (endeffector_offset
    :reader endeffector_offset
    :initarg :endeffector_offset
    :type cl:float
    :initform 0.0)
   (max_speed
    :reader max_speed
    :initarg :max_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveArmIK-request (<MoveArmIK-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveArmIK-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveArmIK-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<MoveArmIK-request> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:MoveArmIK-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:position-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:angle-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:angle instead.")
  (angle m))

(cl:ensure-generic-function 'velocity_controlled-val :lambda-list '(m))
(cl:defmethod velocity_controlled-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:velocity_controlled-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:velocity_controlled instead.")
  (velocity_controlled m))

(cl:ensure-generic-function 'side-val :lambda-list '(m))
(cl:defmethod side-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:side-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:side instead.")
  (side m))

(cl:ensure-generic-function 'endlink_angle-val :lambda-list '(m))
(cl:defmethod endlink_angle-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:endlink_angle-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:endlink_angle instead.")
  (endlink_angle m))

(cl:ensure-generic-function 'horizontal-val :lambda-list '(m))
(cl:defmethod horizontal-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:horizontal-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:horizontal instead.")
  (horizontal m))

(cl:ensure-generic-function 'blocking-val :lambda-list '(m))
(cl:defmethod blocking-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:blocking-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:blocking instead.")
  (blocking m))

(cl:ensure-generic-function 'endeffector_offset-val :lambda-list '(m))
(cl:defmethod endeffector_offset-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:endeffector_offset-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:endeffector_offset instead.")
  (endeffector_offset m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <MoveArmIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:max_speed-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:max_speed instead.")
  (max_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveArmIK-request>) ostream)
  "Serializes a message object of type '<MoveArmIK-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'velocity_controlled) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'side))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'side))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'endlink_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'horizontal) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blocking) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'endeffector_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveArmIK-request>) istream)
  "Deserializes a message object of type '<MoveArmIK-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'velocity_controlled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'side) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'side) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'endlink_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'horizontal) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blocking) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'endeffector_offset) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveArmIK-request>)))
  "Returns string type for a service object of type '<MoveArmIK-request>"
  "slaw_youbot_arm_navigation_srvs/MoveArmIKRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArmIK-request)))
  "Returns string type for a service object of type 'MoveArmIK-request"
  "slaw_youbot_arm_navigation_srvs/MoveArmIKRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveArmIK-request>)))
  "Returns md5sum for a message object of type '<MoveArmIK-request>"
  "422de537244f37b21b06e40c0f081e4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveArmIK-request)))
  "Returns md5sum for a message object of type 'MoveArmIK-request"
  "422de537244f37b21b06e40c0f081e4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveArmIK-request>)))
  "Returns full string definition for message of type '<MoveArmIK-request>"
  (cl:format cl:nil "geometry_msgs/Point position~%float32 angle~%bool velocity_controlled~%string side~%float32 endlink_angle~%bool horizontal~%bool blocking~%float32 endeffector_offset~%float32 max_speed~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveArmIK-request)))
  "Returns full string definition for message of type 'MoveArmIK-request"
  (cl:format cl:nil "geometry_msgs/Point position~%float32 angle~%bool velocity_controlled~%string side~%float32 endlink_angle~%bool horizontal~%bool blocking~%float32 endeffector_offset~%float32 max_speed~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveArmIK-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4
     1
     4 (cl:length (cl:slot-value msg 'side))
     4
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveArmIK-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveArmIK-request
    (cl:cons ':position (position msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':velocity_controlled (velocity_controlled msg))
    (cl:cons ':side (side msg))
    (cl:cons ':endlink_angle (endlink_angle msg))
    (cl:cons ':horizontal (horizontal msg))
    (cl:cons ':blocking (blocking msg))
    (cl:cons ':endeffector_offset (endeffector_offset msg))
    (cl:cons ':max_speed (max_speed msg))
))
;//! \htmlinclude MoveArmIK-response.msg.html

(cl:defclass <MoveArmIK-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass MoveArmIK-response (<MoveArmIK-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveArmIK-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveArmIK-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<MoveArmIK-response> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:MoveArmIK-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveArmIK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:success-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <MoveArmIK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:reason-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:reason instead.")
  (reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveArmIK-response>) ostream)
  "Serializes a message object of type '<MoveArmIK-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveArmIK-response>) istream)
  "Deserializes a message object of type '<MoveArmIK-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveArmIK-response>)))
  "Returns string type for a service object of type '<MoveArmIK-response>"
  "slaw_youbot_arm_navigation_srvs/MoveArmIKResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArmIK-response)))
  "Returns string type for a service object of type 'MoveArmIK-response"
  "slaw_youbot_arm_navigation_srvs/MoveArmIKResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveArmIK-response>)))
  "Returns md5sum for a message object of type '<MoveArmIK-response>"
  "422de537244f37b21b06e40c0f081e4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveArmIK-response)))
  "Returns md5sum for a message object of type 'MoveArmIK-response"
  "422de537244f37b21b06e40c0f081e4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveArmIK-response>)))
  "Returns full string definition for message of type '<MoveArmIK-response>"
  (cl:format cl:nil "bool success~%string reason~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveArmIK-response)))
  "Returns full string definition for message of type 'MoveArmIK-response"
  (cl:format cl:nil "bool success~%string reason~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveArmIK-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveArmIK-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveArmIK-response
    (cl:cons ':success (success msg))
    (cl:cons ':reason (reason msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveArmIK)))
  'MoveArmIK-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveArmIK)))
  'MoveArmIK-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArmIK)))
  "Returns string type for a service object of type '<MoveArmIK>"
  "slaw_youbot_arm_navigation_srvs/MoveArmIK")