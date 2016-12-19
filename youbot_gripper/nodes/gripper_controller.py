#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64
from dynamixel_msgs.msg import JointState
from std_srvs.srv import Empty, EmptyResponse

gripper_open = 3.5
gripper_close = 0.7
max_torque = 0.1
stepsize = 0.025

WARN_TEMP = 60

pub = rospy.Publisher("/gripper_controller/command", Float64, queue_size=10)
sub = rospy.Subscriber("/gripper_controller/state", JointState , joint_states_callback)

def joint_states_callback(msg):
    global effort
    effort = abs(msg.load[0])
    temperatures = msg.motor_temps
    if temperatures > WARN_TEMP:
        rospy.logerr("Temperature is getting hot of the gripper, %s", str(self.temperatures))

def GripperController():
    service_open = rospy.Service("/open_gripper", Empty, openGripper)
    service_close = rospy.Service("/close_gripper", Empty, closeGripper)

def openGripper(req = None):
    send_command(gripper_open)
    if req is not None:
        return EmptyResponse()

def closeGripper(req = None, max_torque):
    gripper_feedback = gripper_open
    for gripper_feedback in range(gripper_close, gripper_open):
        if (is_goal_reached(effort, max_torque)):
            break
        send_command(gripper_feedback)
        gripper_feedback -= stepsize
    if req is not None:
        return EmptyResponse()

def is_goal_reached(effort, max_torque):
    global effort
    if  (effort >  max_torque):
        return True
    return False
    
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
