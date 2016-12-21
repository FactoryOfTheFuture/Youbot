#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64
from dynamixel_msgs.msg import JointState
from std_srvs.srv import Empty, EmptyResponse
from dynamixel_controllers.srv import SetTorqueLimit
gripper_open = 3.5
gripper_close = 0.7
max_torque = 0.02
stepsize = 0.02
global effort, currentpos, prevtemp, moving
effort = 0
currentpos = 0
effortcounter = 0
moving = False

WARN_TEMP = 20
prevtemp = 0

def joint_states_callback(msg):
    global effort, currentpos, prevtemp, moving
    currentpos = msg.current_pos
    effort = abs(msg.load)
    temperature = msg.motor_temps[0]
    moving = msg.is_moving
    if temperature > WARN_TEMP and temperature != prevtemp:
	prevtemp = temperature
	print(temperature)
        rospy.logerr("Temperature warning!")

def GripperController():
    service_open = rospy.Service("/open_gripper", Empty, openGripper)
    service_close = rospy.Service("/close_gripper", Empty, closeGripper)

def openGripper(req = None):
    send_command(gripper_open)
    if req is not None:
        return EmptyResponse()

def closeGripper(req = None):
    global effort, max_torque, currentpos, moving
    gripper_feedback = gripper_open
    counter = 0.0
    lasteffort = 0
    while gripper_feedback > gripper_close and counter < 3:
	if not(lasteffort ==  effort):
            if effort > 0.3:
   	        counter += 1.0
	        lasteffort = effort
		print "counter " + str(counter) + " Torque " + str(effort)
            else:
	        counter = 0.0
	    lasteffort = effort
        error = abs(gripper_feedback-currentpos)
        if error < stepsize*5 or gripper_feedback > currentpos:
            gripper_feedback -= stepsize
            send_command(gripper_feedback)
    pmoving = True
    while effort > max_torque or moving == True:
	if moving == False and pmoving == True:
	    pmoving = False    
	    gripper_feedback += 0.02
	    send_command(gripper_feedback)
	if moving == True:
	    pmoving = True
    print "Final torque " + str(effort)
    print "done closing"
    if req is not None:
        return EmptyResponse()
    
def send_command(cmd):
    #rate = rospy.Rate(20)
    #print cmd
    if cmd > gripper_open:
	cmd = gripper_open
    if cmd < gripper_close:
	cmd = gripper_close
    pub.publish(cmd)

pub = rospy.Publisher("/gripper_controller/command", Float64, queue_size=10)
sub = rospy.Subscriber("/gripper_controller/state", JointState, joint_states_callback)

rospy.wait_for_service("/gripper_controller/set_torque_limit")
ServiceTL = rospy.ServiceProxy("/gripper_controller/set_torque_limit", SetTorqueLimit)

    
if __name__ == '__main__':
    rospy.init_node("gripper_controller_action")
    
    try:
        GripperController()
	ServiceTL(0.6)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
