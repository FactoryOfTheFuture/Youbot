; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_msgs-msg)


;//! \htmlinclude EndeffectorPosition.msg.html

(cl:defclass <EndeffectorPosition> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass EndeffectorPosition (<EndeffectorPosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EndeffectorPosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EndeffectorPosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_msgs-msg:<EndeffectorPosition> is deprecated: use slaw_youbot_arm_navigation_msgs-msg:EndeffectorPosition instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <EndeffectorPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_msgs-msg:position-val is deprecated.  Use slaw_youbot_arm_navigation_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <EndeffectorPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_msgs-msg:angle-val is deprecated.  Use slaw_youbot_arm_navigation_msgs-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EndeffectorPosition>) ostream)
  "Serializes a message object of type '<EndeffectorPosition>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EndeffectorPosition>) istream)
  "Deserializes a message object of type '<EndeffectorPosition>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EndeffectorPosition>)))
  "Returns string type for a message object of type '<EndeffectorPosition>"
  "slaw_youbot_arm_navigation_msgs/EndeffectorPosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EndeffectorPosition)))
  "Returns string type for a message object of type 'EndeffectorPosition"
  "slaw_youbot_arm_navigation_msgs/EndeffectorPosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EndeffectorPosition>)))
  "Returns md5sum for a message object of type '<EndeffectorPosition>"
  "bd328302c3e9f205aea6bb65211e73fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EndeffectorPosition)))
  "Returns md5sum for a message object of type 'EndeffectorPosition"
  "bd328302c3e9f205aea6bb65211e73fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EndeffectorPosition>)))
  "Returns full string definition for message of type '<EndeffectorPosition>"
  (cl:format cl:nil "geometry_msgs/Point position~%float32 angle~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EndeffectorPosition)))
  "Returns full string definition for message of type 'EndeffectorPosition"
  (cl:format cl:nil "geometry_msgs/Point position~%float32 angle~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EndeffectorPosition>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EndeffectorPosition>))
  "Converts a ROS message object to a list"
  (cl:list 'EndeffectorPosition
    (cl:cons ':position (position msg))
    (cl:cons ':angle (angle msg))
))
