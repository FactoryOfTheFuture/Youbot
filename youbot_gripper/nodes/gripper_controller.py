#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64
from std_srvs.srv import Empty, EmptyResponse

gripper_open = 3.5
gripper_close = 0.7

pub = rospy.Publisher("/gripper_controller/command", Float64, queue_size=10)

def GripperController():
    service_open = rospy.Service("/open_gripper", Empty, openGripper)
    service_close = rospy.Service("/close_gripper", Empty, closeGripper)

def openGripper(req = None):
    send_command(gripper_open)
    if req is not None:
        return EmptyResponse()

def closeGripper(req = None):
    send_command(gripper_close)
    if req is not None:
        return EmptyResponse()

    
def send_command(cmd):
    #rate = rospy.Rate(20)
    #print cmd
    pub.publish(cmd)
    
if __name__ == '__main__':
    rospy.init_node("gripper_controller_action")
    
    try:
        GripperController()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
