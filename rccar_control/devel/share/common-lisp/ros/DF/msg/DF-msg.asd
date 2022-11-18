
(cl:in-package :asdf)

(defsystem "DF-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MsgMode" :depends-on ("_package_MsgMode"))
    (:file "_package_MsgMode" :depends-on ("_package"))
    (:file "MsgRF" :depends-on ("_package_MsgRF"))
    (:file "_package_MsgRF" :depends-on ("_package"))
  ))