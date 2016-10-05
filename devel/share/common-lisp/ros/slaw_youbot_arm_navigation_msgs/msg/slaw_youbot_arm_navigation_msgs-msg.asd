
(cl:in-package :asdf)

(defsystem "slaw_youbot_arm_navigation_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "EndeffectorPosition" :depends-on ("_package_EndeffectorPosition"))
    (:file "_package_EndeffectorPosition" :depends-on ("_package"))
    (:file "ArmConfiguration" :depends-on ("_package_ArmConfiguration"))
    (:file "_package_ArmConfiguration" :depends-on ("_package"))
  ))