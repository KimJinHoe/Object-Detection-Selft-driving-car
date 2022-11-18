;; Auto-generated. Do not edit!


(when (boundp 'DF::MsgMode)
  (if (not (find-package "DF"))
    (make-package "DF"))
  (shadow 'MsgMode (find-package "DF")))
(unless (find-package "DF::MSGMODE")
  (make-package "DF::MSGMODE"))

(in-package "ROS")
;;//! \htmlinclude MsgMode.msg.html


(defclass DF::MsgMode
  :super ros::object
  :slots (_modeA _modeB ))

(defmethod DF::MsgMode
  (:init
   (&key
    ((:modeA __modeA) nil)
    ((:modeB __modeB) nil)
    )
   (send-super :init)
   (setq _modeA __modeA)
   (setq _modeB __modeB)
   self)
  (:modeA
   (&optional __modeA)
   (if __modeA (setq _modeA __modeA)) _modeA)
  (:modeB
   (&optional __modeB)
   (if __modeB (setq _modeB __modeB)) _modeB)
  (:serialization-length
   ()
   (+
    ;; bool _modeA
    1
    ;; bool _modeB
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _modeA
       (if _modeA (write-byte -1 s) (write-byte 0 s))
     ;; bool _modeB
       (if _modeB (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _modeA
     (setq _modeA (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _modeB
     (setq _modeB (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get DF::MsgMode :md5sum-) "c191ef596c6c709f494df252088325a1")
(setf (get DF::MsgMode :datatype-) "DF/MsgMode")
(setf (get DF::MsgMode :definition-)
      "bool modeA
bool modeB

")



(provide :DF/MsgMode "c191ef596c6c709f494df252088325a1")


