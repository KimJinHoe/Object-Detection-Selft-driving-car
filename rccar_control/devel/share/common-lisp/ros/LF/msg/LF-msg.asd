
(cl:in-package :asdf)

(defsystem "LF-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MsgDetect" :depends-on ("_package_MsgDetect"))
    (:file "_package_MsgDetect" :depends-on ("_package"))
    (:file "MsgGPS" :depends-on ("_package_MsgGPS"))
    (:file "_package_MsgGPS" :depends-on ("_package"))
  ))