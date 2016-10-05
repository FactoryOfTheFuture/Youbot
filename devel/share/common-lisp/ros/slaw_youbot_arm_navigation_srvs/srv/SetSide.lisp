; Auto-generated. Do not edit!


(cl:in-package slaw_youbot_arm_navigation_srvs-srv)


;//! \htmlinclude SetSide-request.msg.html

(cl:defclass <SetSide-request> (roslisp-msg-protocol:ros-message)
  ((side
    :reader side
    :initarg :side
    :type cl:string
    :initform "")
   (horizontal
    :reader horizontal
    :initarg :horizontal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetSide-request (<SetSide-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSide-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSide-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<SetSide-request> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:SetSide-request instead.")))

(cl:ensure-generic-function 'side-val :lambda-list '(m))
(cl:defmethod side-val ((m <SetSide-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:side-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:side instead.")
  (side m))

(cl:ensure-generic-function 'horizontal-val :lambda-list '(m))
(cl:defmethod horizontal-val ((m <SetSide-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:horizontal-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:horizontal instead.")
  (horizontal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSide-request>) ostream)
  "Serializes a message object of type '<SetSide-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'side))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'side))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'horizontal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSide-request>) istream)
  "Deserializes a message object of type '<SetSide-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'side) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'side) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'horizontal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSide-request>)))
  "Returns string type for a service object of type '<SetSide-request>"
  "slaw_youbot_arm_navigation_srvs/SetSideRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSide-request)))
  "Returns string type for a service object of type 'SetSide-request"
  "slaw_youbot_arm_navigation_srvs/SetSideRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSide-request>)))
  "Returns md5sum for a message object of type '<SetSide-request>"
  "2b0137ce80ad7b5afacec3c023ec686d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSide-request)))
  "Returns md5sum for a message object of type 'SetSide-request"
  "2b0137ce80ad7b5afacec3c023ec686d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSide-request>)))
  "Returns full string definition for message of type '<SetSide-request>"
  (cl:format cl:nil "string side~%bool horizontal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSide-request)))
  "Returns full string definition for message of type 'SetSide-request"
  (cl:format cl:nil "string side~%bool horizontal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSide-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'side))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSide-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSide-request
    (cl:cons ':side (side msg))
    (cl:cons ':horizontal (horizontal msg))
))
;//! \htmlinclude SetSide-response.msg.html

(cl:defclass <SetSide-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass SetSide-response (<SetSide-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSide-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSide-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slaw_youbot_arm_navigation_srvs-srv:<SetSide-response> is deprecated: use slaw_youbot_arm_navigation_srvs-srv:SetSide-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SetSide-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slaw_youbot_arm_navigation_srvs-srv:result-val is deprecated.  Use slaw_youbot_arm_navigation_srvs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSide-response>) ostream)
  "Serializes a message object of type '<SetSide-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSide-response>) istream)
  "Deserializes a message object of type '<SetSide-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSide-response>)))
  "Returns string type for a service object of type '<SetSide-response>"
  "slaw_youbot_arm_navigation_srvs/SetSideResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSide-response)))
  "Returns string type for a service object of type 'SetSide-response"
  "slaw_youbot_arm_navigation_srvs/SetSideResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSide-response>)))
  "Returns md5sum for a message object of type '<SetSide-response>"
  "2b0137ce80ad7b5afacec3c023ec686d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSide-response)))
  "Returns md5sum for a message object of type 'SetSide-response"
  "2b0137ce80ad7b5afacec3c023ec686d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSide-response>)))
  "Returns full string definition for message of type '<SetSide-response>"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSide-response)))
  "Returns full string definition for message of type 'SetSide-response"
  (cl:format cl:nil "string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSide-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSide-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSide-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSide)))
  'SetSide-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSide)))
  'SetSide-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSide)))
  "Returns string type for a service object of type '<SetSide>"
  "slaw_youbot_arm_navigation_srvs/SetSide")