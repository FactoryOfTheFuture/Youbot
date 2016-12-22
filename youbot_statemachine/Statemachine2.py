#!/usr/bin/env python

import sys
import rospy
import std_srvs.srv
from std_msgs.msg import String,Bool,Float32
from geometry_msgs.msg import Pose2D,Point
import slaw_youbot_arm_navigation_srvs.srv


class statemachineclass:
    
    def __init__(self):
	rospy.init_node('youbot_sm')
	rate = rospy.Rate(10)
	
	#Declare all Variables        
	self.Busy = False	

        #Declare all Services 
        rospy.wait_for_service('untuck_arm')
        self.arm_untuck = rospy.ServiceProxy('untuck_arm',std_srvs.srv.Empty)
        
        rospy.wait_for_service('arm_camerapos')
        self.arm_camerapos = rospy.ServiceProxy('arm_camerapos',std_srvs.srv.Empty)

        rospy.wait_for_service('tuck_arm')
        self.arm_tuck = rospy.ServiceProxy('tuck_arm',std_srvs.srv.Empty)

        rospy.wait_for_service('move_arm_ik')
        self.arm_object = rospy.ServiceProxy('move_arm_ik', slaw_youbot_arm_navigation_srvs.srv.MoveArmIK)
        
        rospy.wait_for_service('open_gripper')
        self.gripper_open = rospy.ServiceProxy('open_gripper', std_srvs.srv.Empty)

        rospy.wait_for_service('close_gripper')
        self.gripper_close = rospy.ServiceProxy('close_gripper', std_srvs.srv.Empty) 

        # Subscribe/Publish to Topics
        self.vision_pub = rospy.Publisher('vision/comm', String,queue_size=1)
        self.vision_sub = rospy.Subscriber('vision/comm', String,self.state)
        self.vision_pos = rospy.Subscriber('vision/pos', Pose2D, self.PixToMeter)
        self.Interface_sub = rospy.Subscriber('interface_comm', String, self.InterfaceInput)    

        #init position
        self.gripper_open()
        self.arm_tuck()

    def state(self, state):
	self.State = state.data
	print state.data
	if self.State == "Busy":
	    self.Busy = True
	    self.ObjectFound = False
	    self.ObjectNotFound = False
	elif self.State == "object found":
	    self.Busy = False
	    self.ObjectFound = True
	    self.ObjectNotFound = False         
	elif self.State == "object not found":
	    self.Busy = False
	    self.ObjectFound = False
	    self.ObjectNotFound = True
	else:
	    print "vision communication failed"
	    self.Failure()

    def PixToMeter(self, position):
        #calibration vision pixels to real world distance
	self.objectposition = Point(0.0,0.0,0.0)
        self.objectposition.x = (position.x*0.00067)+0.27
        self.objectposition.y = (position.y*0.00055)+0.02
        self.objectposition.z = 0.205
        self.angle = position.theta
   
    def InterfaceInput(self, objectlist):
        print objectlist.data
        action = objectlist.data.split(" | ")
        action.pop(len(action)-1)
        for item in action:
            print item
            product = item.split(" : ")[0]
            pick_place = item.split(" : ")[1]
            drop_place = item.split(" : ")[2]
            self.objects = []
            self.objects.append(product)
            self.pick_places = []
            self.pick_places.append(pick_place)
            self.drop_places = []
            self.drop_places.append(drop_place)
	print "naar main"
	self.Main()

    def ObjectDetection(self):
        self.arm_camerapos()
        self.vision_pub.publish("request " + self.objects[0])
	
    def Failure(self):
	self.arm_tuck()

    def ArmObject(self):
	print self.arm_object(self.objectposition,self.angle,True,"front",0.0,False,True,-0.22,0.8)

    def Main(self):
	self.ObjectDetection()
	self.gripper_open()
	while self.Busy == False:
	    pass
	while self.Busy == True:
	    pass
	if self.ObjectFound == True:
	    print "object posistion: " + str(self.objectposition)
	    self.ArmObject()
	elif self.ObjectNotFound == True:
	    self.Failure()
	else:
	    self.Failure()       

if __name__ == '__main__':
    statemachine = statemachineclass()
    rospy.spin()

