#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64
from dynamixel_msgs.msg import JointState
from std_srvs.srv import Empty, EmptyResponse

gripper_open = 3.5
gripper_close = 0.7
max_torque = 0.2
stepsize = 0.01
global effort, currentpos
effort = -1
currentpos = 0
effortcounter = 0

WARN_TEMP = 60


def joint_states_callback(msg):
    global effort, currentpos
    currentpos = msg.current_pos
    effort = abs(msg.load)
    temperatures = msg.motor_temps[0]
    #print(moving)
    if temperatures > WARN_TEMP:
	print(temperatures)
        rospy.logerr("gripper is too hot!")

def GripperController():
    service_open = rospy.Service("/open_gripper", Empty, openGripper)
    service_close = rospy.Service("/close_gripper", Empty, closeGripper)

def openGripper(req = None):
    send_command(gripper_open)
    if req is not None:
        return EmptyResponse()

def closeGripper(req = None):
    global effort, max_torque, currentpos
    gripper_feedback = gripper_open
    counter = 0.0
    lasteffort = 0
    while gripper_feedback > gripper_close and counter < 3:
	if not(lasteffort ==  effort):
            if effort > max_torque:
   	        counter += 1.0
	        lasteffort = effort
            else:
	        counter = 0.0
	    lasteffort = effort
	    print counter
        error = abs(gripper_feedback-currentpos)
        if error < 0.2 or gripper_feedback > currentpos:
            send_command(gripper_feedback)
            gripper_feedback -= stepsize
    print "done closing"
    if req is not None:
        return EmptyResponse()
    
def send_command(cmd):
    #rate = rospy.Rate(20)
    #print cmd
    pub.publish(cmd)

pub = rospy.Publisher("/gripper_controller/command", Float64, queue_size=10)
sub = rospy.Subscriber("/gripper_controller/state", JointState, joint_states_callback)

    
if __name__ == '__main__':
    rospy.init_node("gripper_controller_action")
    
    try:
        GripperController()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
