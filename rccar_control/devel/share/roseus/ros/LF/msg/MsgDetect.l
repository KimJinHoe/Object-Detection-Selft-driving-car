;; Auto-generated. Do not edit!


(when (boundp 'LF::MsgDetect)
  (if (not (find-package "LF"))
    (make-package "LF"))
  (shadow 'MsgDetect (find-package "LF")))
(unless (find-package "LF::MSGDETECT")
  (make-package "LF::MSGDETECT"))

(in-package "ROS")
;;//! \htmlinclude MsgDetect.msg.html


(defclass LF::MsgDetect
  :super ros::object
  :slots (_detect ))

(defmethod LF::MsgDetect
  (:init
   (&key
    ((:detect __detect) 0)
    )
   (send-super :init)
   (setq _detect (round __detect))
   self)
  (:detect
   (&optional __detect)
   (if __detect (setq _detect __detect)) _detect)
  (:serialization-length
   ()
   (+
    ;; int32 _detect
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _detect
       (write-long _detect s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _detect
     (setq _detect (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get LF::MsgDetect :md5sum-) "3cbf5ce45bbe7286edd5b1ffe23d39a0")
(setf (get LF::MsgDetect :datatype-) "LF/MsgDetect")
(setf (get LF::MsgDetect :definition-)
      "int32 detect


")



(provide :LF/MsgDetect "3cbf5ce45bbe7286edd5b1ffe23d39a0")


