; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_actions-msg)


;//! \htmlinclude MoveArmIKGoal.msg.html

(cl:defclass <MoveArmIKGoal> (roslisp-msg-protocol:ros-message)
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
   (side
    :reader side
    :initarg :side
    :type cl:string
    :initform "")
   (velocity_controlled
    :reader velocity_controlled
    :initarg :velocity_controlled
    :type cl:boolean
    :initform cl:nil)
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

(cl:defclass MoveArmIKGoal (<MoveArmIKGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveArmIKGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveArmIKGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_actions-msg:<MoveArmIKGoal> is deprecated: use slaw_youbot_arm_navigation_actions-msg:MoveArmIKGoal instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:position-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:angle-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'side-val :lambda-list '(m))
(cl:defmethod side-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:side-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:side instead.")
  (side m))

(cl:ensure-generic-function 'velocity_controlled-val :lambda-list '(m))
(cl:defmethod velocity_controlled-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:velocity_controlled-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:velocity_controlled instead.")
  (velocity_controlled m))

(cl:ensure-generic-function 'endlink_angle-val :lambda-list '(m))
(cl:defmethod endlink_angle-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:endlink_angle-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:endlink_angle instead.")
  (endlink_angle m))

(cl:ensure-generic-function 'horizontal-val :lambda-list '(m))
(cl:defmethod horizontal-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:horizontal-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:horizontal instead.")
  (horizontal m))

(cl:ensure-generic-function 'endeffector_offset-val :lambda-list '(m))
(cl:defmethod endeffector_offset-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:endeffector_offset-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:endeffector_offset instead.")
  (endeffector_offset m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <MoveArmIKGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:max_speed-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:max_speed instead.")
  (max_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveArmIKGoal>) ostream)
  "Serializes a message object of type '<MoveArmIKGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'side))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'side))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'velocity_controlled) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'endlink_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'horizontal) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveArmIKGoal>) istream)
  "Deserializes a message object of type '<MoveArmIKGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'side) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'side) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'velocity_controlled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'endlink_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'horizontal) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveArmIKGoal>)))
  "Returns string type for a message object of type '<MoveArmIKGoal>"
  "slaw_youbot_arm_navigation_actions/MoveArmIKGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArmIKGoal)))
  "Returns string type for a message object of type 'MoveArmIKGoal"
  "slaw_youbot_arm_navigation_actions/MoveArmIKGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveArmIKGoal>)))
  "Returns md5sum for a message object of type '<MoveArmIKGoal>"
  "8a94cf100fc9942d638bc51be7b67ca2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveArmIKGoal)))
  "Returns md5sum for a message object of type 'MoveArmIKGoal"
  "8a94cf100fc9942d638bc51be7b67ca2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveArmIKGoal>)))
  "Returns full string definition for message of type '<MoveArmIKGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%geometry_msgs/Point position~%float32 angle~%string side~%bool velocity_controlled~%float32 endlink_angle~%bool horizontal~%float32 endeffector_offset~%float32 max_speed~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveArmIKGoal)))
  "Returns full string definition for message of type 'MoveArmIKGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%geometry_msgs/Point position~%float32 angle~%string side~%bool velocity_controlled~%float32 endlink_angle~%bool horizontal~%float32 endeffector_offset~%float32 max_speed~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveArmIKGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4
     4 (cl:length (cl:slot-value msg 'side))
     1
     4
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveArmIKGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveArmIKGoal
    (cl:cons ':position (position msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':side (side msg))
    (cl:cons ':velocity_controlled (velocity_controlled msg))
    (cl:cons ':endlink_angle (endlink_angle msg))
    (cl:cons ':horizontal (horizontal msg))
    (cl:cons ':endeffector_offset (endeffector_offset msg))
    (cl:cons ':max_speed (max_speed msg))
))
