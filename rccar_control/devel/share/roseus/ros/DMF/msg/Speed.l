;; Auto-generated. Do not edit!


(when (boundp 'DMF::Speed)
  (if (not (find-package "DMF"))
    (make-package "DMF"))
  (shadow 'Speed (find-package "DMF")))
(unless (find-package "DMF::SPEED")
  (make-package "DMF::SPEED"))

(in-package "ROS")
;;//! \htmlinclude Speed.msg.html


(defclass DMF::Speed
  :super ros::object
  :slots (_speed _detect ))

(defmethod DMF::Speed
  (:init
   (&key
    ((:speed __speed) 0)
    ((:detect __detect) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   (setq _detect (round __detect))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:detect
   (&optional __detect)
   (if __detect (setq _detect __detect)) _detect)
  (:serialization-length
   ()
   (+
    ;; int32 _speed
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
     ;; int32 _detect
       (write-long _detect s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _detect
     (setq _detect (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get DMF::Speed :md5sum-) "a8a40abb3e4c019d7e3a9e9a3dddd6b9")
(setf (get DMF::Speed :datatype-) "DMF/Speed")
(setf (get DMF::Speed :definition-)
      "int32 speed
int32 detect

")



(provide :DMF/Speed "a8a40abb3e4c019d7e3a9e9a3dddd6b9")


