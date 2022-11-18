;; Auto-generated. Do not edit!


(when (boundp 'LF::MsgGPS)
  (if (not (find-package "LF"))
    (make-package "LF"))
  (shadow 'MsgGPS (find-package "LF")))
(unless (find-package "LF::MSGGPS")
  (make-package "LF::MSGGPS"))

(in-package "ROS")
;;//! \htmlinclude MsgGPS.msg.html


(defclass LF::MsgGPS
  :super ros::object
  :slots (_lati _longi ))

(defmethod LF::MsgGPS
  (:init
   (&key
    ((:lati __lati) 0.0)
    ((:longi __longi) 0.0)
    )
   (send-super :init)
   (setq _lati (float __lati))
   (setq _longi (float __longi))
   self)
  (:lati
   (&optional __lati)
   (if __lati (setq _lati __lati)) _lati)
  (:longi
   (&optional __longi)
   (if __longi (setq _longi __longi)) _longi)
  (:serialization-length
   ()
   (+
    ;; float64 _lati
    8
    ;; float64 _longi
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _lati
       (sys::poke _lati (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longi
       (sys::poke _longi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _lati
     (setq _lati (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longi
     (setq _longi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get LF::MsgGPS :md5sum-) "133854799976de73c17e7e3d8d5130e7")
(setf (get LF::MsgGPS :datatype-) "LF/MsgGPS")
(setf (get LF::MsgGPS :definition-)
      "float64 lati 
float64 longi

")



(provide :LF/MsgGPS "133854799976de73c17e7e3d8d5130e7")


