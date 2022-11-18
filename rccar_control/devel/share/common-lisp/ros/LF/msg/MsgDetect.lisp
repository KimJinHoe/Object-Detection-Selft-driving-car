; Auto-generated. Do not edit!


(cl:in-package LF-msg)


;//! \htmlinclude MsgDetect.msg.html

(cl:defclass <MsgDetect> (roslisp-msg-protocol:ros-message)
  ((detect
    :reader detect
    :initarg :detect
    :type cl:integer
    :initform 0))
)

(cl:defclass MsgDetect (<MsgDetect>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgDetect>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgDetect)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name LF-msg:<MsgDetect> is deprecated: use LF-msg:MsgDetect instead.")))

(cl:ensure-generic-function 'detect-val :lambda-list '(m))
(cl:defmethod detect-val ((m <MsgDetect>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader LF-msg:detect-val is deprecated.  Use LF-msg:detect instead.")
  (detect m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgDetect>) ostream)
  "Serializes a message object of type '<MsgDetect>"
  (cl:let* ((signed (cl:slot-value msg 'detect)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgDetect>) istream)
  "Deserializes a message object of type '<MsgDetect>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'detect) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgDetect>)))
  "Returns string type for a message object of type '<MsgDetect>"
  "LF/MsgDetect")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgDetect)))
  "Returns string type for a message object of type 'MsgDetect"
  "LF/MsgDetect")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgDetect>)))
  "Returns md5sum for a message object of type '<MsgDetect>"
  "3cbf5ce45bbe7286edd5b1ffe23d39a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgDetect)))
  "Returns md5sum for a message object of type 'MsgDetect"
  "3cbf5ce45bbe7286edd5b1ffe23d39a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgDetect>)))
  "Returns full string definition for message of type '<MsgDetect>"
  (cl:format cl:nil "int32 detect~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgDetect)))
  "Returns full string definition for message of type 'MsgDetect"
  (cl:format cl:nil "int32 detect~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgDetect>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgDetect>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgDetect
    (cl:cons ':detect (detect msg))
))
