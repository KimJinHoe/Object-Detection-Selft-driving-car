;; Auto-generated. Do not edit!


(when (boundp 'DF::MsgRF)
  (if (not (find-package "DF"))
    (make-package "DF"))
  (shadow 'MsgRF (find-package "DF")))
(unless (find-package "DF::MSGRF")
  (make-package "DF::MSGRF"))

(in-package "ROS")
;;//! \htmlinclude MsgRF.msg.html


(defclass DF::MsgRF
  :super ros::object
  :slots (_stamp _axis_x _axis_y _axis_setMode ))

(defmethod DF::MsgRF
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:axis_x __axis_x) 0)
    ((:axis_y __axis_y) 0)
    ((:axis_setMode __axis_setMode) 0)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _axis_x (round __axis_x))
   (setq _axis_y (round __axis_y))
   (setq _axis_setMode (round __axis_setMode))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:axis_x
   (&optional __axis_x)
   (if __axis_x (setq _axis_x __axis_x)) _axis_x)
  (:axis_y
   (&optional __axis_y)
   (if __axis_y (setq _axis_y __axis_y)) _axis_y)
  (:axis_setMode
   (&optional __axis_setMode)
   (if __axis_setMode (setq _axis_setMode __axis_setMode)) _axis_setMode)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; int32 _axis_x
    4
    ;; int32 _axis_y
    4
    ;; int32 _axis_setMode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; int32 _axis_x
       (write-long _axis_x s)
     ;; int32 _axis_y
       (write-long _axis_y s)
     ;; int32 _axis_setMode
       (write-long _axis_setMode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _axis_x
     (setq _axis_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _axis_y
     (setq _axis_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _axis_setMode
     (setq _axis_setMode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get DF::MsgRF :md5sum-) "a0fc0b336c867cc76e65ffd4a8ba7649")
(setf (get DF::MsgRF :datatype-) "DF/MsgRF")
(setf (get DF::MsgRF :definition-)
      "time stamp
int32 axis_x
int32 axis_y
int32 axis_setMode

")



(provide :DF/MsgRF "a0fc0b336c867cc76e65ffd4a8ba7649")


