; Auto-generated. Do not edit!


(cl:in-package DF-msg)


;//! \htmlinclude MsgMode.msg.html

(cl:defclass <MsgMode> (roslisp-msg-protocol:ros-message)
  ((modeA
    :reader modeA
    :initarg :modeA
    :type cl:boolean
    :initform cl:nil)
   (modeB
    :reader modeB
    :initarg :modeB
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MsgMode (<MsgMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MsgMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MsgMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name DF-msg:<MsgMode> is deprecated: use DF-msg:MsgMode instead.")))

(cl:ensure-generic-function 'modeA-val :lambda-list '(m))
(cl:defmethod modeA-val ((m <MsgMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DF-msg:modeA-val is deprecated.  Use DF-msg:modeA instead.")
  (modeA m))

(cl:ensure-generic-function 'modeB-val :lambda-list '(m))
(cl:defmethod modeB-val ((m <MsgMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader DF-msg:modeB-val is deprecated.  Use DF-msg:modeB instead.")
  (modeB m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MsgMode>) ostream)
  "Serializes a message object of type '<MsgMode>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'modeA) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'modeB) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MsgMode>) istream)
  "Deserializes a message object of type '<MsgMode>"
    (cl:setf (cl:slot-value msg 'modeA) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'modeB) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MsgMode>)))
  "Returns string type for a message object of type '<MsgMode>"
  "DF/MsgMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MsgMode)))
  "Returns string type for a message object of type 'MsgMode"
  "DF/MsgMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MsgMode>)))
  "Returns md5sum for a message object of type '<MsgMode>"
  "c191ef596c6c709f494df252088325a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MsgMode)))
  "Returns md5sum for a message object of type 'MsgMode"
  "c191ef596c6c709f494df252088325a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MsgMode>)))
  "Returns full string definition for message of type '<MsgMode>"
  (cl:format cl:nil "bool modeA~%bool modeB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MsgMode)))
  "Returns full string definition for message of type 'MsgMode"
  (cl:format cl:nil "bool modeA~%bool modeB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MsgMode>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MsgMode>))
  "Converts a ROS message object to a list"
  (cl:list 'MsgMode
    (cl:cons ':modeA (modeA msg))
    (cl:cons ':modeB (modeB msg))
))
