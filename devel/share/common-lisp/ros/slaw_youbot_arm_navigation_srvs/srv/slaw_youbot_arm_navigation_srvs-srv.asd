
(cl:in-package :asdf)

(defsystem "slaw_youbot_arm_navigation_srvs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :slaw_youbot_arm_navigation_msgs-msg
)
  :components ((:file "_package")
    (:file "MoveArm" :depends-on ("_package_MoveArm"))
    (:file "_package_MoveArm" :depends-on ("_package"))
    (:file "SimpleIkSolver" :depends-on ("_package_SimpleIkSolver"))
    (:file "_package_SimpleIkSolver" :depends-on ("_package"))
    (:file "SetSide" :depends-on ("_package_SetSide"))
    (:file "_package_SetSide" :depends-on ("_package"))
    (:file "MoveArmLinear" :depends-on ("_package_MoveArmLinear"))
    (:file "_package_MoveArmLinear" :depends-on ("_package"))
    (:file "MoveJoints" :depends-on ("_package_MoveJoints"))
    (:file "_package_MoveJoints" :depends-on ("_package"))
    (:file "MoveArmIK" :depends-on ("_package_MoveArmIK"))
    (:file "_package_MoveArmIK" :depends-on ("_package"))
  ))