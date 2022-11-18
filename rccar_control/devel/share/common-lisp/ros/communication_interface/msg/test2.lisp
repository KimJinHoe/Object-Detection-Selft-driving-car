; Auto-generated. Do not edit!


(cl:in-package communication_interface-msg)


;//! \htmlinclude test2.msg.html

(cl:defclass <test2> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass test2 (<test2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <test2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'test2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name communication_interface-msg:<test2> is deprecated: use communication_interface-msg:test2 instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <test2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader communication_interface-msg:data-val is deprecated.  Use communication_interface-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test2>) ostream)
  "Serializes a message object of type '<test2>"
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <test2>) istream)
  "Deserializes a message object of type '<test2>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<test2>)))
  "Returns string type for a message object of type '<test2>"
  "communication_interface/test2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test2)))
  "Returns string type for a message object of type 'test2"
  "communication_interface/test2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test2>)))
  "Returns md5sum for a message object of type '<test2>"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test2)))
  "Returns md5sum for a message object of type 'test2"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test2>)))
  "Returns full string definition for message of type '<test2>"
  (cl:format cl:nil "int32 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test2)))
  "Returns full string definition for message of type 'test2"
  (cl:format cl:nil "int32 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test2>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test2>))
  "Converts a ROS message object to a list"
  (cl:list 'test2
    (cl:cons ':data (data msg))
))
