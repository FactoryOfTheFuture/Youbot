; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_actions-msg)


;//! \htmlinclude MoveArmLinearGoal.msg.html

(cl:defclass <MoveArmLinearGoal> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector slaw_youbot_arm_navigation_msgs-msg:EndeffectorPosition)
   :initform (cl:make-array 0 :element-type 'slaw_youbot_arm_navigation_msgs-msg:EndeffectorPosition :initial-element (cl:make-instance 'slaw_youbot_arm_navigation_msgs-msg:EndeffectorPosition)))
   (max_speed
    :reader max_speed
    :initarg :max_speed
    :type cl:float
    :initform 0.0)
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
   (endeffector_offset
    :reader endeffector_offset
    :initarg :endeffector_offset
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveArmLinearGoal (<MoveArmLinearGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveArmLinearGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveArmLinearGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_actions-msg:<MoveArmLinearGoal> is deprecated: use slaw_youbot_arm_navigation_actions-msg:MoveArmLinearGoal instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <MoveArmLinearGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:points-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:points instead.")
  (points m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <MoveArmLinearGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:max_speed-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:max_speed instead.")
  (max_speed m))

(cl:ensure-generic-function 'side-val :lambda-list '(m))
(cl:defmethod side-val ((m <MoveArmLinearGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:side-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:side instead.")
  (side m))

(cl:ensure-generic-function 'endlink_angle-val :lambda-list '(m))
(cl:defmethod endlink_angle-val ((m <MoveArmLinearGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:endlink_angle-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:endlink_angle instead.")
  (endlink_angle m))

(cl:ensure-generic-function 'horizontal-val :lambda-list '(m))
(cl:defmethod horizontal-val ((m <MoveArmLinearGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:horizontal-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:horizontal instead.")
  (horizontal m))

(cl:ensure-generic-function 'endeffector_offset-val :lambda-list '(m))
(cl:defmethod endeffector_offset-val ((m <MoveArmLinearGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:endeffector_offset-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:endeffector_offset instead.")
  (endeffector_offset m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveArmLinearGoal>) ostream)
  "Serializes a message object of type '<MoveArmLinearGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_speed))))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveArmLinearGoal>) istream)
  "Deserializes a message object of type '<MoveArmLinearGoal>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'slaw_youbot_arm_navigation_msgs-msg:EndeffectorPosition))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'endeffector_offset) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveArmLinearGoal>)))
  "Returns string type for a message object of type '<MoveArmLinearGoal>"
  "slaw_youbot_arm_navigation_actions/MoveArmLinearGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveArmLinearGoal)))
  "Returns string type for a message object of type 'MoveArmLinearGoal"
  "slaw_youbot_arm_navigation_actions/MoveArmLinearGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveArmLinearGoal>)))
  "Returns md5sum for a message object of type '<MoveArmLinearGoal>"
  "8291b0dd133b6af7ea6c884dbf61b421")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveArmLinearGoal)))
  "Returns md5sum for a message object of type 'MoveArmLinearGoal"
  "8291b0dd133b6af7ea6c884dbf61b421")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveArmLinearGoal>)))
  "Returns full string definition for message of type '<MoveArmLinearGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%slaw_youbot_arm_navigation_msgs/EndeffectorPosition[] points~%float32 max_speed~%string side~%float32 endlink_angle~%bool horizontal~%float32 endeffector_offset~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/EndeffectorPosition~%geometry_msgs/Point position~%float32 angle~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveArmLinearGoal)))
  "Returns full string definition for message of type 'MoveArmLinearGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%slaw_youbot_arm_navigation_msgs/EndeffectorPosition[] points~%float32 max_speed~%string side~%float32 endlink_angle~%bool horizontal~%float32 endeffector_offset~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/EndeffectorPosition~%geometry_msgs/Point position~%float32 angle~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveArmLinearGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4 (cl:length (cl:slot-value msg 'side))
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveArmLinearGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveArmLinearGoal
    (cl:cons ':points (points msg))
    (cl:cons ':max_speed (max_speed msg))
    (cl:cons ':side (side msg))
    (cl:cons ':endlink_angle (endlink_angle msg))
    (cl:cons ':horizontal (horizontal msg))
    (cl:cons ':endeffector_offset (endeffector_offset msg))
))
