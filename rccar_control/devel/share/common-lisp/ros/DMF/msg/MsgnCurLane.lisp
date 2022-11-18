; Auto-generated. Do not edit!


(cl:in-package DMF-msg)


;//! \htmlinclude MsgnCurLane.msg.html

(cl:defclass <MsgnCurLane> (roslisp-msg-protocol:ros-message)
  ((nCurLane
    :reader nCurLane
    :initarg :nCurLane
    :type cl:integer
    :initform 0))
)

(cl:defclass MsgnCurLane (<MsgnCurLane>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgnCurLane>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgnCurLane)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name DMF-msg:<MsgnCurLane> is deprecated: use DMF-msg:MsgnCurLane instead.")))

(cl:ensure-generic-function 'nCurLane-val :lambda-list '(m))
(cl:defmethod nCurLane-val ((m <MsgnCurLane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DMF-msg:nCurLane-val is deprecated.  Use DMF-msg:nCurLane instead.")
  (nCurLane m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgnCurLane>) ostream)
  "Serializes a message object of type '<MsgnCurLane>"
  (cl:let* ((signed (cl:slot-value msg 'nCurLane)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgnCurLane>) istream)
  "Deserializes a message object of type '<MsgnCurLane>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nCurLane) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgnCurLane>)))
  "Returns string type for a message object of type '<MsgnCurLane>"
  "DMF/MsgnCurLane")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgnCurLane)))
  "Returns string type for a message object of type 'MsgnCurLane"
  "DMF/MsgnCurLane")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgnCurLane>)))
  "Returns md5sum for a message object of type '<MsgnCurLane>"
  "dbea93705dcaf6e7297bfe685098a446")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgnCurLane)))
  "Returns md5sum for a message object of type 'MsgnCurLane"
  "dbea93705dcaf6e7297bfe685098a446")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgnCurLane>)))
  "Returns full string definition for message of type '<MsgnCurLane>"
  (cl:format cl:nil "int32 nCurLane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgnCurLane)))
  "Returns full string definition for message of type 'MsgnCurLane"
  (cl:format cl:nil "int32 nCurLane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgnCurLane>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgnCurLane>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgnCurLane
    (cl:cons ':nCurLane (nCurLane msg))
))
