; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_actions-msg)


;//! \htmlinclude VelocityControlledJointTrajectoryGoal.msg.html

(cl:defclass <VelocityControlledJointTrajectoryGoal> (roslisp-msg-protocol:ros-message)
  ((configurations
    :reader configurations
    :initarg :configurations
    :type (cl:vector slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration)
   :initform (cl:make-array 0 :element-type 'slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration :initial-element (cl:make-instance 'slaw_youbot_arm_navigation_msgs-msg:ArmConfiguration)))
   (max_speed
    :reader max_speed
    :initarg :max_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass VelocityControlledJointTrajectoryGoal (<VelocityControlledJointTrajectoryGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelocityControlledJointTrajectoryGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelocityControlledJointTrajectoryGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_actions-msg:<VelocityControlledJointTrajectoryGoal> is deprecated: use slaw_youbot_arm_navigation_actions-msg:VelocityControlledJointTrajectoryGoal instead.")))

(cl:ensure-generic-function 'configurations-val :lambda-list '(m))
(cl:defmethod configurations-val ((m <VelocityControlledJointTrajectoryGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:configurations-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:configurations instead.")
  (configurations m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <VelocityControlledJointTrajectoryGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_actions-msg:max_speed-val is deprecated.  Use slaw_youbot_arm_navigation_actions-msg:max_speed instead.")
  (max_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelocityControlledJointTrajectoryGoal>) ostream)
  "Serializes a message object of type '<VelocityControlledJointTrajectoryGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'configurations))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'configurations))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelocityControlledJointTrajectoryGoal>) istream)
  "Deserializes a message object of type '<VelocityControlledJointTrajectoryGoal>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelocityControlledJointTrajectoryGoal>)))
  "Returns string type for a message object of type '<VelocityControlledJointTrajectoryGoal>"
  "slaw_youbot_arm_navigation_actions/VelocityControlledJointTrajectoryGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelocityControlledJointTrajectoryGoal)))
  "Returns string type for a message object of type 'VelocityControlledJointTrajectoryGoal"
  "slaw_youbot_arm_navigation_actions/VelocityControlledJointTrajectoryGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelocityControlledJointTrajectoryGoal>)))
  "Returns md5sum for a message object of type '<VelocityControlledJointTrajectoryGoal>"
  "703dceb116ce4d94e1e5ecb7f9888a37")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelocityControlledJointTrajectoryGoal)))
  "Returns md5sum for a message object of type 'VelocityControlledJointTrajectoryGoal"
  "703dceb116ce4d94e1e5ecb7f9888a37")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelocityControlledJointTrajectoryGoal>)))
  "Returns full string definition for message of type '<VelocityControlledJointTrajectoryGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%slaw_youbot_arm_navigation_msgs/ArmConfiguration[] configurations~%float32 max_speed~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/ArmConfiguration~%float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelocityControlledJointTrajectoryGoal)))
  "Returns full string definition for message of type 'VelocityControlledJointTrajectoryGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%slaw_youbot_arm_navigation_msgs/ArmConfiguration[] configurations~%float32 max_speed~%~%================================================================================~%MSG: slaw_youbot_arm_navigation_msgs/ArmConfiguration~%float32 arm_joint_1~%float32 arm_joint_2~%float32 arm_joint_3~%float32 arm_joint_4~%float32 arm_joint_5~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelocityControlledJointTrajectoryGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'configurations) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelocityControlledJointTrajectoryGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'VelocityControlledJointTrajectoryGoal
    (cl:cons ':configurations (configurations msg))
    (cl:cons ':max_speed (max_speed msg))
))
