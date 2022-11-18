
(cl:in-package :asdf)

(defsystem "communication_interface-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GPS_data" :depends-on ("_package_GPS_data"))
    (:file "_package_GPS_data" :depends-on ("_package"))
    (:file "test" :depends-on ("_package_test"))
    (:file "_package_test" :depends-on ("_package"))
    (:file "test2" :depends-on ("_package_test2"))
    (:file "_package_test2" :depends-on ("_package"))
  ))