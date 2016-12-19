#!/usr/bin/env python

import sys
import rospy
import std_srvs.srv
from std_msgs.msg import String,Bool,Float32
from geometry_msgs.msg import Pose2D,Point
import slaw_youbot_arm_navigation_srvs.srv
global objectposition
objectposition = Point(0.0,0.0,0.0)
global angle
angle = 0.0
global next
next = True

def state(state):
    print state.data
    if state.data == "object found":
	print "obejct posistion: " + global objectposition
    	velocity_controlled = True
    	side = ""
    	endlink_angle = 0.0
    	horizontal = False
    	blocking = True
    	endeffector_offset = -0.22
    	max_speed = 0.8
	gripper_open()
    	print arm_object(objectposition,angle,velocity_controlled,side,endlink_angle,horizontal,blocking,endeffector_offset,max_speed)
	gripper_close()
	rospy.sleep(1)
	arm_untuck()
        global next
        next = True
 
def pos(position):
    print position
    objectposition.x = (position.x*0.00067)+0.27
    objectposition.y = (position.y*0.00055)+0.02
    objectposition.z = 0.205
    global angle
    angle = position.theta

def interfaceinput(ifinput):
    print ifinput.data
    actions = ifinput.data.split(" | ")
    actions.pop(len(actions)-1)
    for item in actions:
	print item
	object1 = item.split(" : ")[0]
	place1 = item.split(" : ")[1]
	place2 = item.split(" : ")[2]
	arm_camerapos()
	gripper_close()
	vision_pub.publish("request " + object1)
	global next
	next = False
	while next == False:
	    rospy.sleep(0.1)
	

if __name__ == '__main__':
    rospy.init_node('youbot_sm')

    rate = rospy.Rate(10)


    rospy.wait_for_service('untuck_arm')
    arm_untuck = rospy.ServiceProxy('untuck_arm',std_srvs.srv.Empty)
    
    rospy.wait_for_service('arm_camerapos')
    arm_camerapos = rospy.ServiceProxy('arm_camerapos',std_srvs.srv.Empty)

    rospy.wait_for_service('tuck_arm')
    arm_tuck = rospy.ServiceProxy('tuck_arm',std_srvs.srv.Empty)

    rospy.wait_for_service('move_arm_ik')
    arm_object = rospy.ServiceProxy('move_arm_ik', slaw_youbot_arm_navigation_srvs.srv.MoveArmIK)
    
    rospy.wait_for_service('open_gripper')
    gripper_open = rospy.ServiceProxy('open_gripper', std_srvs.srv.Empty)

    rospy.wait_for_service('close_gripper')
    gripper_close = rospy.ServiceProxy('close_gripper', std_srvs.srv.Empty) 

    
    vision_pub = rospy.Publisher('vision/comm', String,queue_size=1)
    vision_sub = rospy.Subscriber('vision/comm', String, state)
    vision_pos = rospy.Subscriber('vision/pos', Pose2D, pos)
    rospy.Subscriber('interface_comm', String, interfaceinput)    
    arm_tuck()
    rospy.spin()
    
