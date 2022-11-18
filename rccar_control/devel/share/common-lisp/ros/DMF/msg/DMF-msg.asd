
(cl:in-package :asdf)

(defsystem "DMF-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MsgLine" :depends-on ("_package_MsgLine"))
    (:file "_package_MsgLine" :depends-on ("_package"))
    (:file "MsgSpeed" :depends-on ("_package_MsgSpeed"))
    (:file "_package_MsgSpeed" :depends-on ("_package"))
    (:file "MsgnCurLane" :depends-on ("_package_MsgnCurLane"))
    (:file "_package_MsgnCurLane" :depends-on ("_package"))
    (:file "Speed" :depends-on ("_package_Speed"))
    (:file "_package_Speed" :depends-on ("_package"))
  ))