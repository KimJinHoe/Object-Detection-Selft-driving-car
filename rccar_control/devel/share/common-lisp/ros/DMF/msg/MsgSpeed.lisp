; Auto-generated. Do not edit!


(cl:in-package DMF-msg)


;//! \htmlinclude MsgSpeed.msg.html

(cl:defclass <MsgSpeed> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:integer
    :initform 0)
   (detect
    :reader detect
    :initarg :detect
    :type cl:integer
    :initform 0))
)

(cl:defclass MsgSpeed (<MsgSpeed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgSpeed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgSpeed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name DMF-msg:<MsgSpeed> is deprecated: use DMF-msg:MsgSpeed instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <MsgSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DMF-msg:speed-val is deprecated.  Use DMF-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <MsgSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DMF-msg:angle-val is deprecated.  Use DMF-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'detect-val :lambda-list '(m))
(cl:defmethod detect-val ((m <MsgSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DMF-msg:detect-val is deprecated.  Use DMF-msg:detect instead.")
  (detect m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgSpeed>) ostream)
  "Serializes a message object of type '<MsgSpeed>"
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'detect)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgSpeed>) istream)
  "Deserializes a message object of type '<MsgSpeed>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'detect) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgSpeed>)))
  "Returns string type for a message object of type '<MsgSpeed>"
  "DMF/MsgSpeed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgSpeed)))
  "Returns string type for a message object of type 'MsgSpeed"
  "DMF/MsgSpeed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgSpeed>)))
  "Returns md5sum for a message object of type '<MsgSpeed>"
  "853e99bee3ef2ccbccc03b9c8c648993")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgSpeed)))
  "Returns md5sum for a message object of type 'MsgSpeed"
  "853e99bee3ef2ccbccc03b9c8c648993")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgSpeed>)))
  "Returns full string definition for message of type '<MsgSpeed>"
  (cl:format cl:nil "int32 speed~%int32 angle~%int32 detect~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgSpeed)))
  "Returns full string definition for message of type 'MsgSpeed"
  (cl:format cl:nil "int32 speed~%int32 angle~%int32 detect~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgSpeed>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgSpeed>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgSpeed
    (cl:cons ':speed (speed msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':detect (detect msg))
))
