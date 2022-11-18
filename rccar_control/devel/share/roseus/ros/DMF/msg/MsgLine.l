;; Auto-generated. Do not edit!


(when (boundp 'DMF::MsgLine)
  (if (not (find-package "DMF"))
    (make-package "DMF"))
  (shadow 'MsgLine (find-package "DMF")))
(unless (find-package "DMF::MSGLINE")
  (make-package "DMF::MSGLINE"))

(in-package "ROS")
;;//! \htmlinclude MsgLine.msg.html


(defclass DMF::MsgLine
  :super ros::object
  :slots (_num ))

(defmethod DMF::MsgLine
  (:init
   (&key
    ((:num __num) 0)
    )
   (send-super :init)
   (setq _num (round __num))
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:serialization-length
   ()
   (+
    ;; int32 _num
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num
       (write-long _num s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num
     (setq _num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get DMF::MsgLine :md5sum-) "54b3c80efd6fae6e6ffff8a4b9facd69")
(setf (get DMF::MsgLine :datatype-) "DMF/MsgLine")
(setf (get DMF::MsgLine :definition-)
      "int32 num

")



(provide :DMF/MsgLine "54b3c80efd6fae6e6ffff8a4b9facd69")


