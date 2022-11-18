; Auto-generated. Do not edit!


(cl:in-package DMF-msg)


;//! \htmlinclude Speed.msg.html

(cl:defclass <Speed> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0)
   (detect
    :reader detect
    :initarg :detect
    :type cl:integer
    :initform 0))
)

(cl:defclass Speed (<Speed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Speed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Speed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name DMF-msg:<Speed> is deprecated: use DMF-msg:Speed instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DMF-msg:speed-val is deprecated.  Use DMF-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'detect-val :lambda-list '(m))
(cl:defmethod detect-val ((m <Speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DMF-msg:detect-val is deprecated.  Use DMF-msg:detect instead.")
  (detect m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Speed>) ostream)
  "Serializes a message object of type '<Speed>"
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Speed>) istream)
  "Deserializes a message object of type '<Speed>"
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
      (cl:setf (cl:slot-value msg 'detect) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Speed>)))
  "Returns string type for a message object of type '<Speed>"
  "DMF/Speed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed)))
  "Returns string type for a message object of type 'Speed"
  "DMF/Speed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Speed>)))
  "Returns md5sum for a message object of type '<Speed>"
  "a8a40abb3e4c019d7e3a9e9a3dddd6b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Speed)))
  "Returns md5sum for a message object of type 'Speed"
  "a8a40abb3e4c019d7e3a9e9a3dddd6b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Speed>)))
  "Returns full string definition for message of type '<Speed>"
  (cl:format cl:nil "int32 speed~%int32 detect~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Speed)))
  "Returns full string definition for message of type 'Speed"
  (cl:format cl:nil "int32 speed~%int32 detect~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Speed>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Speed>))
  "Converts a ROS message object to a list"
  (cl:list 'Speed
    (cl:cons ':speed (speed msg))
    (cl:cons ':detect (detect msg))
))
