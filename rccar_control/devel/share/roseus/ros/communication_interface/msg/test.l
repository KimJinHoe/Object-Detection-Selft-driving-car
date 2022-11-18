;; Auto-generated. Do not edit!


(when (boundp 'communication_interface::test)
  (if (not (find-package "COMMUNICATION_INTERFACE"))
    (make-package "COMMUNICATION_INTERFACE"))
  (shadow 'test (find-package "COMMUNICATION_INTERFACE")))
(unless (find-package "COMMUNICATION_INTERFACE::TEST")
  (make-package "COMMUNICATION_INTERFACE::TEST"))

(in-package "ROS")
;;//! \htmlinclude test.msg.html


(defclass communication_interface::test
  :super ros::object
  :slots (_data ))

(defmethod communication_interface::test
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _data
       (write-long _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get communication_interface::test :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get communication_interface::test :datatype-) "communication_interface/test")
(setf (get communication_interface::test :definition-)
      "int32 data

")



(provide :communication_interface/test "da5909fbe378aeaf85e547e830cc1bb7")


