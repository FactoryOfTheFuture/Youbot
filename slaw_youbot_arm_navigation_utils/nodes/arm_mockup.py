#!/usr/bin/env python
import rospy
import numpy as np
from sensor_msgs.msg import JointState
from brics_actuator.msg import JointVelocities, JointPositions

arm_tucked = [0.011, 0.011, -0.016, 0.023, 0.111]
RATE = 50


class ArmMockup:
    def __init__(self):
        self.joint_names = rospy.get_param("joint_names")
        self.joints = rospy.get_param('joints')

        self.joint_pub = rospy.Publisher('/joint_states', JointState, queue_size=10)
        self.configuration = np.array(arm_tucked)
        self.velocities = np.array([0.0] * len(arm_tucked))
        self.joint_msg = JointState()
        self.joint_msg.effort = [0] * len(arm_tucked)
        self.joint_msg.name = self.joint_names

        self.min_values = np.array([0.0] * len(arm_tucked))
        self.max_values = np.array([0.0] * len(arm_tucked))
        for idx, name in enumerate(self.joint_names):
            self.min_values[idx] = self.joints[name]['min']
            self.max_values[idx] = self.joints[name]['max']

        rospy.Subscriber('/arm_1/arm_controller/position_command', JointPositions, self.position_cb)
        rospy.Subscriber('/arm_1/arm_controller/velocity_command', JointVelocities, self.velocities_cb)

    def position_cb(self, msg):
        #self.velocities = np.array([0.0] * len(arm_tucked))
        for joint_value in msg.positions:
            if joint_value.joint_uri in self.joint_names:
                index = self.joint_names.index(joint_value.joint_uri)
                self.configuration[index] = joint_value.value
                self.velocities[index] = 0.0

    def velocities_cb(self, msg):
        for joint_value in msg.velocities:
            if joint_value.joint_uri in self.joint_names:
                index = self.joint_names.index(joint_value.joint_uri)
                self.velocities[index] = joint_value.value

    def update_joints(self):
        time_dif = (rospy.Time.now() - self.joint_msg.header.stamp).to_sec()

        self.configuration += self.velocities * time_dif

        idx_min = np.where((self.configuration - self.min_values) < 0.0)
        idx_max = np.where((self.configuration - self.max_values) > 0.0)

        for i in idx_max[0]:
            self.velocities[i] = 0.

        for i in idx_min[0]:
            self.velocities[i] = 0.

        self.configuration = np.maximum(self.configuration, self.min_values)
        self.configuration = np.minimum(self.configuration, self.max_values)

        self.joint_msg.position = list(self.configuration)
        self.joint_msg.velocity = list(self.velocities)

        self.joint_msg.header.stamp = rospy.Time.now()

    def publish_joints(self):
        self.update_joints()
        self.joint_pub.publish(self.joint_msg)

    def spin(self):
        r = rospy.Rate(RATE)
        while not rospy.is_shutdown():
            self.publish_joints()
            r.sleep()

if __name__ == '__main__':
    rospy.init_node('arm_mockup')
    arm = ArmMockup()
    arm.spin()
