#!/usr/bin/env python
import rospy
import sensor_msgs.msg
import actionlib
import brics_actuator.msg
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryResult
import numpy as np

arm_up_pose = [0.011, 1.04883, -2.43523, 1.73184, 0.2]
LIMIT_OVER_EFFORT = 2


class JointTrajectoryAction:
    def __init__(self):
        self.received_state = False

        if not rospy.has_param("joint_trajectory_action/unit"):
            rospy.logerr("No unit given.")
            exit(0)

        if not rospy.has_param("joint_trajectory_action/joint_names"):
            rospy.logerr("No joints given.")
            exit(0)
        self.joints = rospy.get_param('joint_trajectory_action/joints')
        self.joint_names = rospy.get_param("joint_trajectory_action/joint_names")

        rospy.loginfo("Joints: %s", self.joint_names)
        self.configuration = [0 for i in range(len(self.joint_names))]
        self.efforts = [0 for i in range(len(self.joint_names))]

        self.unit = rospy.get_param("joint_trajectory_action/unit")
        rospy.loginfo("Unit: %s", self.unit)

        self.goal_diffs = rospy.get_param("joint_trajectory_action/constraints")
        self.max_effort = rospy.get_param("joint_trajectory_action/max_effort")

        self.counter = 0
        # how often does the correct reading have to be there
        self.goal_success = rospy.get_param("joint_trajectory_action/goal_success", 10)

        # subscriptions
        rospy.Subscriber("joint_states", sensor_msgs.msg.JointState, self.joint_states_callback)

        self.position_pub = rospy.Publisher("position_command", brics_actuator.msg.JointPositions, queue_size=10)

        self.position_action_server = actionlib.SimpleActionServer("joint_trajectory_action",
                                                                   FollowJointTrajectoryAction,
                                                                   self.execute_position_cb, False)
        self.position_action_server.start()

    def joint_states_callback(self, msg):
        for k in range(len(self.joint_names)):
            for i in range(len(msg.name)):
                if msg.name[i] == self.joint_names[k]:
                    self.configuration[k] = msg.position[i]
                    if len(msg.effort) > i:
                        self.efforts[k] = abs(msg.effort[i])
                        if self.efforts[k] > self.max_effort:
                            rospy.logerr("joint %d over effort with (%f)", k, self.efforts[k])
        self.received_state = True

    def limit_joint(self, joint, value):
        if joint in self.joints.keys():
            val_min = self.joints[joint]['min']
            val_max = self.joints[joint]['max']
            if value <= val_min:
                return val_min + 0.001
            if value >= val_max:
                return val_max - 0.001
        return value

    def is_over_effort(self):
        for idx, effort in enumerate(self.efforts):
            if abs(effort) > self.max_effort:
                rospy.logerr("joint %d Over Voltage (%f)", idx + 1, effort)
                return True
        return False

    def arm_up_recover(self):
        arm_up_without_turn = [x for x in arm_up_pose]
        arm_up_without_turn[0] = self.configuration[0]
        arm_up_without_turn[4] = self.configuration[4]

        joint_positions = brics_actuator.msg.JointPositions()
        conf = arm_up_without_turn

        # transform from ROS to BRICS message
        for j in range(len(self.joint_names)):
            joint_value = brics_actuator.msg.JointValue()
            joint_value.joint_uri = self.joint_names[j]
            joint_value.value = self.limit_joint(self.joint_names[j], conf[j])
            joint_value.unit = self.unit
            joint_positions.positions.append(joint_value)
        self.position_pub.publish(joint_positions)
        rospy.sleep(1)

    def execute_position_cb(self, goal):
        is_timed_out = False
        is_over_effort = False
        over_effort_counter = 0
        start = rospy.Time.now()
        extra_time = rospy.Duration(5.0)
        # print goal
        for i in range(len(goal.trajectory.points)):
            joint_positions = brics_actuator.msg.JointPositions()
            conf = np.array(goal.trajectory.points[i].positions)

            # transform from ROS to BRICS message
            for j in range(len(self.joint_names)):
                joint_value = brics_actuator.msg.JointValue()
                joint_value.joint_uri = self.joint_names[j]
                joint_value.value = self.limit_joint(self.joint_names[j], conf[j])
                conf[j] = joint_value.value
                joint_value.unit = self.unit
                joint_positions.positions.append(joint_value)
            if self.is_over_effort():
                over_effort_counter += 1
                rospy.logerr("%d, over effort", over_effort_counter)
                if over_effort_counter > LIMIT_OVER_EFFORT:
                    is_over_effort = True
                    break

            self.position_pub.publish(joint_positions)

            # wait to reach the goal position
            while not rospy.is_shutdown():
                if self.is_over_effort():
                    over_effort_counter += 1
                    rospy.logerr("%d, over effort", over_effort_counter)
                    if over_effort_counter > LIMIT_OVER_EFFORT:
                        is_over_effort = True
                        break
                if self.is_goal_reached(conf, self.configuration):
                    rospy.sleep(0.01)
                    break

                if (rospy.Time.now() - start) > (goal.trajectory.points[i].time_from_start + extra_time):
                    is_timed_out = True
                    break
                rospy.sleep(0.01)

            if is_timed_out or is_over_effort:
                break

        result = FollowJointTrajectoryResult()
        if is_over_effort:
            result.error_code = FollowJointTrajectoryResult.PATH_TOLERANCE_VIOLATED
            rospy.logerr("arm over-effort")

            self.arm_up_recover()
            self.position_action_server.set_preempted(result)

        elif is_timed_out:
            result.error_code = FollowJointTrajectoryResult.PATH_TOLERANCE_VIOLATED
            rospy.logerr("arm timed_out")

            self.arm_up_recover()
            self.position_action_server.set_aborted(result)
        else:
            result.error_code = FollowJointTrajectoryResult.SUCCESSFUL
            self.position_action_server.set_succeeded(result)

    def is_goal_reached(self, goal, conf):
        for i in range(len(self.joint_names)):
            if abs(goal[i] - conf[i]) > self.goal_diffs['goal_dif']:
                self.counter = 0
                return False
        # rospy.logerr("done")
        self.counter += 1
        if self.counter > self.goal_success:
            self.counter = 0
            return True
        else:
            return False


if __name__ == "__main__":
    rospy.init_node("joint_trajectory_action")
    rospy.sleep(0.1)
    action = JointTrajectoryAction()
    rospy.spin()
