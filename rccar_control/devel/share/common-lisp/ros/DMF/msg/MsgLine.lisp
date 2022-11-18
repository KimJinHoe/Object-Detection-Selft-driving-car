; Auto-generated. Do not edit!


(cl:in-package DMF-msg)


;//! \htmlinclude MsgLine.msg.html

(cl:defclass <MsgLine> (roslisp-msg-protocol:ros-message)
  ((num
    :reader num
    :initarg :num
    :type cl:integer
    :initform 0))
)

(cl:defclass MsgLine (<MsgLine>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgLine>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgLine)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name DMF-msg:<MsgLine> is deprecated: use DMF-msg:MsgLine instead.")))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <MsgLine>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DMF-msg:num-val is deprecated.  Use DMF-msg:num instead.")
  (num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgLine>) ostream)
  "Serializes a message object of type '<MsgLine>"
  (cl:let* ((signed (cl:slot-value msg 'num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgLine>) istream)
  "Deserializes a message object of type '<MsgLine>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgLine>)))
  "Returns string type for a message object of type '<MsgLine>"
  "DMF/MsgLine")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgLine)))
  "Returns string type for a message object of type 'MsgLine"
  "DMF/MsgLine")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgLine>)))
  "Returns md5sum for a message object of type '<MsgLine>"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgLine)))
  "Returns md5sum for a message object of type 'MsgLine"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgLine>)))
  "Returns full string definition for message of type '<MsgLine>"
  (cl:format cl:nil "int32 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgLine)))
  "Returns full string definition for message of type 'MsgLine"
  (cl:format cl:nil "int32 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgLine>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgLine>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgLine
    (cl:cons ':num (num msg))
))
