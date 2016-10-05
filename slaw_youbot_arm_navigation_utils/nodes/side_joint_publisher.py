#!/usr/bin/env python
import math
import rospy
from sensor_msgs.msg import JointState
from slaw_youbot_arm_navigation_srvs.srv import SetSide, SetSideResponse
RATE = 50

SIDE_VALUES = {'front': -math.pi/2., 'left': 0.}
SIDES = ['left', 'front']


class SideJointPublisher:
    def __init__(self):
        self.joint_name = rospy.get_param("side_joint_name", 'side_joint')

        self.joint_pub = rospy.Publisher('/joint_states', JointState, queue_size=10)
        self.side = 'left'
        self.configuration = [SIDE_VALUES[self.side]]

        self.joint_msg = JointState()
        self.joint_msg.effort = [0.]
        self.joint_msg.name = [self.joint_name]
        self.joint_msg.position = self.configuration
        self.joint_msg.velocity = [0.]
        rospy.Service('/set_side_joint', SetSide, self.set_side_cb)

    def set_side_cb(self, req):
        res = SetSideResponse()
        if req.side in SIDES:
            self.side = req.side
            res.result = 'Set side to ' + self.side
            self.configuration = [SIDE_VALUES[self.side]]
            self.joint_msg.position = self.configuration

        else:
            res.result = 'Side not known: ' + req.side + 'valid are ' + str(SIDES)
        return res

    def publish_joints(self):
        self.joint_msg.header.stamp = rospy.Time.now()
        self.joint_pub.publish(self.joint_msg)

    def spin(self):
        r = rospy.Rate(RATE)
        while not rospy.is_shutdown():
            self.publish_joints()
            r.sleep()

if __name__ == '__main__':
    rospy.init_node('side_joint')
    arm = SideJointPublisher()
    arm.spin()
