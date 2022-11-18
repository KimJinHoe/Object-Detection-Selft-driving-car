; Auto-generated. Do not edit!


(cl:in-package DF-msg)


;//! \htmlinclude MsgRF.msg.html

(cl:defclass <MsgRF> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (axis_x
    :reader axis_x
    :initarg :axis_x
    :type cl:integer
    :initform 0)
   (axis_y
    :reader axis_y
    :initarg :axis_y
    :type cl:integer
    :initform 0)
   (axis_setMode
    :reader axis_setMode
    :initarg :axis_setMode
    :type cl:integer
    :initform 0))
)

(cl:defclass MsgRF (<MsgRF>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgRF>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgRF)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name DF-msg:<MsgRF> is deprecated: use DF-msg:MsgRF instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <MsgRF>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DF-msg:stamp-val is deprecated.  Use DF-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'axis_x-val :lambda-list '(m))
(cl:defmethod axis_x-val ((m <MsgRF>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DF-msg:axis_x-val is deprecated.  Use DF-msg:axis_x instead.")
  (axis_x m))

(cl:ensure-generic-function 'axis_y-val :lambda-list '(m))
(cl:defmethod axis_y-val ((m <MsgRF>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DF-msg:axis_y-val is deprecated.  Use DF-msg:axis_y instead.")
  (axis_y m))

(cl:ensure-generic-function 'axis_setMode-val :lambda-list '(m))
(cl:defmethod axis_setMode-val ((m <MsgRF>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DF-msg:axis_setMode-val is deprecated.  Use DF-msg:axis_setMode instead.")
  (axis_setMode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgRF>) ostream)
  "Serializes a message object of type '<MsgRF>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let* ((signed (cl:slot-value msg 'axis_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'axis_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'axis_setMode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgRF>) istream)
  "Deserializes a message object of type '<MsgRF>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'axis_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'axis_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'axis_setMode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgRF>)))
  "Returns string type for a message object of type '<MsgRF>"
  "DF/MsgRF")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgRF)))
  "Returns string type for a message object of type 'MsgRF"
  "DF/MsgRF")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgRF>)))
  "Returns md5sum for a message object of type '<MsgRF>"
  "a0fc0b336c867cc76e65ffd4a8ba7649")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgRF)))
  "Returns md5sum for a message object of type 'MsgRF"
  "a0fc0b336c867cc76e65ffd4a8ba7649")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgRF>)))
  "Returns full string definition for message of type '<MsgRF>"
  (cl:format cl:nil "time stamp~%int32 axis_x~%int32 axis_y~%int32 axis_setMode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgRF)))
  "Returns full string definition for message of type 'MsgRF"
  (cl:format cl:nil "time stamp~%int32 axis_x~%int32 axis_y~%int32 axis_setMode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgRF>))
  (cl:+ 0
     8
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgRF>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgRF
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':axis_x (axis_x msg))
    (cl:cons ':axis_y (axis_y msg))
    (cl:cons ':axis_setMode (axis_setMode msg))
))
