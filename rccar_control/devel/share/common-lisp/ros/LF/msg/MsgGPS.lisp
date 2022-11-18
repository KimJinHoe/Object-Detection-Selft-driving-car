; Auto-generated. Do not edit!


(cl:in-package LF-msg)


;//! \htmlinclude MsgGPS.msg.html

(cl:defclass <MsgGPS> (roslisp-msg-protocol:ros-message)
  ((lati
    :reader lati
    :initarg :lati
    :type cl:float
    :initform 0.0)
   (longi
    :reader longi
    :initarg :longi
    :type cl:float
    :initform 0.0))
)

(cl:defclass MsgGPS (<MsgGPS>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgGPS>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgGPS)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name LF-msg:<MsgGPS> is deprecated: use LF-msg:MsgGPS instead.")))

(cl:ensure-generic-function 'lati-val :lambda-list '(m))
(cl:defmethod lati-val ((m <MsgGPS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader LF-msg:lati-val is deprecated.  Use LF-msg:lati instead.")
  (lati m))

(cl:ensure-generic-function 'longi-val :lambda-list '(m))
(cl:defmethod longi-val ((m <MsgGPS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader LF-msg:longi-val is deprecated.  Use LF-msg:longi instead.")
  (longi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgGPS>) ostream)
  "Serializes a message object of type '<MsgGPS>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lati))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgGPS>) istream)
  "Deserializes a message object of type '<MsgGPS>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lati) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longi) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgGPS>)))
  "Returns string type for a message object of type '<MsgGPS>"
  "LF/MsgGPS")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgGPS)))
  "Returns string type for a message object of type 'MsgGPS"
  "LF/MsgGPS")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgGPS>)))
  "Returns md5sum for a message object of type '<MsgGPS>"
  "133854799976de73c17e7e3d8d5130e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgGPS)))
  "Returns md5sum for a message object of type 'MsgGPS"
  "133854799976de73c17e7e3d8d5130e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgGPS>)))
  "Returns full string definition for message of type '<MsgGPS>"
  (cl:format cl:nil "float64 lati ~%float64 longi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgGPS)))
  "Returns full string definition for message of type 'MsgGPS"
  (cl:format cl:nil "float64 lati ~%float64 longi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgGPS>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgGPS>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgGPS
    (cl:cons ':lati (lati msg))
    (cl:cons ':longi (longi msg))
))
