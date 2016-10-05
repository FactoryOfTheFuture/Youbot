; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_srvs-srv)


;//! \htmlinclude SimpleIkSolver-request.msg.html

(cl:defclass <SimpleIkSolver-request> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type geometry_msgs-msg:PointStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PointStamped))
   (endeffector_offset
    :reader endeffector_offset
    :initarg :endeffector_offset
    :type cl:float
    :initform 0.0)
   (endlink_angle
    :reader endlink_angle
    :initarg :endlink_angle
    :type cl:float
    :initform 0.0)
   (position
    :reader position
    :initarg :position
    :type cl:string
    :initform "")
   (horizontal
    :reader horizontal
    :initarg :horizontal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SimpleIkSolver-request (<SimpleIkSolver-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimpleIkSolver-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimpleIkSolver-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<SimpleIkSolver-request> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:SimpleIkSolver-request instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <SimpleIkSolver-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:point-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:point instead.")
  (point m))

(cl:ensure-generic-function 'endeffector_offset-val :lambda-list '(m))
(cl:defmethod endeffector_offset-val ((m <SimpleIkSolver-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:endeffector_offset-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:endeffector_offset instead.")
  (endeffector_offset m))

(cl:ensure-generic-function 'endlink_angle-val :lambda-list '(m))
(cl:defmethod endlink_angle-val ((m <SimpleIkSolver-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:endlink_angle-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:endlink_angle instead.")
  (endlink_angle m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <SimpleIkSolver-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:position-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'horizontal-val :lambda-list '(m))
(cl:defmethod horizontal-val ((m <SimpleIkSolver-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:horizontal-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:horizontal instead.")
  (horizontal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimpleIkSolver-request>) ostream)
  "Serializes a message object of type '<SimpleIkSolver-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'endeffector_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'endlink_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'position))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'horizontal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimpleIkSolver-request>) istream)
  "Deserializes a message object of type '<SimpleIkSolver-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point) istream)
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
    (cl:setf (cl:slot-value msg 'endlink_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'position) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'horizontal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimpleIkSolver-request>)))
  "Returns string type for a service object of type '<SimpleIkSolver-request>"
  "slaw_youbot_arm_navigation_srvs/SimpleIkSolverRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleIkSolver-request)))
  "Returns string type for a service object of type 'SimpleIkSolver-request"
  "slaw_youbot_arm_navigation_srvs/SimpleIkSolverRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimpleIkSolver-request>)))
  "Returns md5sum for a message object of type '<SimpleIkSolver-request>"
  "05bbbcf867270d7063ea11257da792a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimpleIkSolver-request)))
  "Returns md5sum for a message object of type 'SimpleIkSolver-request"
  "05bbbcf867270d7063ea11257da792a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimpleIkSolver-request>)))
  "Returns full string definition for message of type '<SimpleIkSolver-request>"
  (cl:format cl:nil "geometry_msgs/PointStamped point~%float32 endeffector_offset~%float32 endlink_angle~%string position~%bool horizontal~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimpleIkSolver-request)))
  "Returns full string definition for message of type 'SimpleIkSolver-request"
  (cl:format cl:nil "geometry_msgs/PointStamped point~%float32 endeffector_offset~%float32 endlink_angle~%string position~%bool horizontal~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimpleIkSolver-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point))
     4
     4
     4 (cl:length (cl:slot-value msg 'position))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimpleIkSolver-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SimpleIkSolver-request
    (cl:cons ':point (point msg))
    (cl:cons ':endeffector_offset (endeffector_offset msg))
    (cl:cons ':endlink_angle (endlink_angle msg))
    (cl:cons ':position (position msg))
    (cl:cons ':horizontal (horizontal msg))
))
;//! \htmlinclude SimpleIkSolver-response.msg.html

(cl:defclass <SimpleIkSolver-response> (roslisp-msg-protocol:ros-message)
  ((joints
    :reader joints
    :initarg :joints
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SimpleIkSolver-response (<SimpleIkSolver-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimpleIkSolver-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimpleIkSolver-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<SimpleIkSolver-response> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:SimpleIkSolver-response instead.")))

(cl:ensure-generic-function 'joints-val :lambda-list '(m))
(cl:defmethod joints-val ((m <SimpleIkSolver-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:joints-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:joints instead.")
  (joints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimpleIkSolver-response>) ostream)
  "Serializes a message object of type '<SimpleIkSolver-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'joints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimpleIkSolver-response>) istream)
  "Deserializes a message object of type '<SimpleIkSolver-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimpleIkSolver-response>)))
  "Returns string type for a service object of type '<SimpleIkSolver-response>"
  "slaw_youbot_arm_navigation_srvs/SimpleIkSolverResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleIkSolver-response)))
  "Returns string type for a service object of type 'SimpleIkSolver-response"
  "slaw_youbot_arm_navigation_srvs/SimpleIkSolverResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimpleIkSolver-response>)))
  "Returns md5sum for a message object of type '<SimpleIkSolver-response>"
  "05bbbcf867270d7063ea11257da792a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimpleIkSolver-response)))
  "Returns md5sum for a message object of type 'SimpleIkSolver-response"
  "05bbbcf867270d7063ea11257da792a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimpleIkSolver-response>)))
  "Returns full string definition for message of type '<SimpleIkSolver-response>"
  (cl:format cl:nil "float64[] joints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimpleIkSolver-response)))
  "Returns full string definition for message of type 'SimpleIkSolver-response"
  (cl:format cl:nil "float64[] joints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimpleIkSolver-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimpleIkSolver-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SimpleIkSolver-response
    (cl:cons ':joints (joints msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SimpleIkSolver)))
  'SimpleIkSolver-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SimpleIkSolver)))
  'SimpleIkSolver-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleIkSolver)))
  "Returns string type for a service object of type '<SimpleIkSolver>"
  "slaw_youbot_arm_navigation_srvs/SimpleIkSolver")