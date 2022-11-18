;; Auto-generated. Do not edit!


(when (boundp 'DMF::MsgSpeed)
  (if (not (find-package "DMF"))
    (make-package "DMF"))
  (shadow 'MsgSpeed (find-package "DMF")))
(unless (find-package "DMF::MSGSPEED")
  (make-package "DMF::MSGSPEED"))

(in-package "ROS")
;;//! \htmlinclude MsgSpeed.msg.html


(defclass DMF::MsgSpeed
  :super ros::object
  :slots (_speed _angle _detect ))

(defmethod DMF::MsgSpeed
  (:init
   (&key
    ((:speed __speed) 0)
    ((:angle __angle) 0)
    ((:detect __detect) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   (setq _angle (round __angle))
   (setq _detect (round __detect))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:detect
   (&optional __detect)
   (if __detect (setq _detect __detect)) _detect)
  (:serialization-length
   ()
   (+
    ;; int32 _speed
    4
    ;; int32 _angle
    4
    ;; int32 _detect
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _speed
       (write-long _speed s)
     ;; int32 _angle
       (write-long _angle s)
     ;; int32 _detect
       (write-long _detect s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _angle
     (setq _angle (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _detect
     (setq _detect (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get DMF::MsgSpeed :md5sum-) "853e99bee3ef2ccbccc03b9c8c648993")
(setf (get DMF::MsgSpeed :datatype-) "DMF/MsgSpeed")
(setf (get DMF::MsgSpeed :definition-)
      "int32 speed
int32 angle
int32 detect

")



(provide :DMF/MsgSpeed "853e99bee3ef2ccbccc03b9c8c648993")


