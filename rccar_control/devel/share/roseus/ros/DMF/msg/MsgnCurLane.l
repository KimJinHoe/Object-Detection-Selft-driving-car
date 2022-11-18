;; Auto-generated. Do not edit!


(when (boundp 'DMF::MsgnCurLane)
  (if (not (find-package "DMF"))
    (make-package "DMF"))
  (shadow 'MsgnCurLane (find-package "DMF")))
(unless (find-package "DMF::MSGNCURLANE")
  (make-package "DMF::MSGNCURLANE"))

(in-package "ROS")
;;//! \htmlinclude MsgnCurLane.msg.html


(defclass DMF::MsgnCurLane
  :super ros::object
  :slots (_nCurLane ))

(defmethod DMF::MsgnCurLane
  (:init
   (&key
    ((:nCurLane __nCurLane) 0)
    )
   (send-super :init)
   (setq _nCurLane (round __nCurLane))
   self)
  (:nCurLane
   (&optional __nCurLane)
   (if __nCurLane (setq _nCurLane __nCurLane)) _nCurLane)
  (:serialization-length
   ()
   (+
    ;; int32 _nCurLane
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _nCurLane
       (write-long _nCurLane s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _nCurLane
     (setq _nCurLane (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get DMF::MsgnCurLane :md5sum-) "dbea93705dcaf6e7297bfe685098a446")
(setf (get DMF::MsgnCurLane :datatype-) "DMF/MsgnCurLane")
(setf (get DMF::MsgnCurLane :definition-)
      "int32 nCurLane

")



(provide :DMF/MsgnCurLane "dbea93705dcaf6e7297bfe685098a446")


