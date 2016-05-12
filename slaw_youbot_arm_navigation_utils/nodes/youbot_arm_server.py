#!/usr/bin/env python
import math
import numpy as np

import actionlib
import rospy
from actionlib_msgs.msg import GoalStatus
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryGoal
from slaw_youbot_arm_navigation_actions.msg import MoveArmIKAction, MoveArmIKResult, \
    VelocityControlledJointTrajectoryAction, VelocityControlledJointTrajectoryGoal, MoveArmLinearAction, \
    MoveArmLinearGoal, MoveArmIKGoal
from slaw_youbot_arm_navigation_msgs.msg import ArmConfiguration
from slaw_youbot_arm_navigation_srvs.srv import MoveArm, MoveArmIKResponse, MoveArmIK, MoveArmResponse, \
    MoveArmLinear, MoveArmLinearResponse, MoveJoints, MoveJointsResponse, MoveArmLinearRequest, MoveJointsRequest, \
    MoveArmIKRequest, MoveArmRequest
from std_srvs.srv import Empty, EmptyResponse
from sensor_msgs.msg import JointState
from trajectory_msgs.msg import JointTrajectoryPoint

from slaw_youbot_arm_navigation_utils.arm_utils import create_arm_up, create_tucked, joint_names, get_forward_angle_joint_5, \
    call_ik_solver, configuration_to_array

MAX_SPEED = math.pi/2.
CHECK_STATUS_RATE = 20


class ArmServer(object):
    def __init__(self):
        # Get controller name and start joint trajectory action clients
        self.configuration = [0] * len(joint_names)

        self.move_duration = rospy.get_param('~move_duration', 2.5)
        arm_position_action_name = rospy.get_param('~arm_joint_trajectory_action',
                                                   '/arm_1/arm_controller/joint_trajectory_action')

        self.arm_position_joint_client = actionlib.SimpleActionClient(arm_position_action_name,
                                                                      FollowJointTrajectoryAction)
        arm_velocity_action_name = rospy.get_param('~arm_velocity_trajectory_action',
                                                   '/arm_1/arm_controller/joint_velocity_action')
        self.arm_velocity_joint_client = actionlib.SimpleActionClient(arm_velocity_action_name,
                                                                      VelocityControlledJointTrajectoryAction)

        arm_linear_action_name = rospy.get_param('~arm_linear_trajectory_action',
                                                   '/arm_1/arm_controller/follow_linear_positions')
        self.arm_linear_joint_client = actionlib.SimpleActionClient(arm_linear_action_name,
                                                                      MoveArmLinearAction)

        # subscriber
        rospy.Subscriber('/joint_states', JointState, self.joint_states_callback)

        # action
        self.arm_ik_action_server = actionlib.simple_action_server.SimpleActionServer(
            'move_arm_ik_action', MoveArmIKAction, self.execute_arm_ik_action, auto_start=False)

        self.arm_ik_action_server.start()
        # services
        rospy.Service("/tuck_arm", Empty, self.tuck)
        rospy.Service("/untuck_arm", Empty, self.untuck)
        rospy.Service("/move_arm", MoveArm, self.move_arm)
        rospy.Service("/move_arm_ik", MoveArmIK, self.move_arm_ik)
        rospy.Service("/move_arm_linear", MoveArmLinear, self.move_arm_linear)
        rospy.Service("/move_joints", MoveJoints, self.move_joints)
        rospy.Service("/move_joints_diff", MoveJoints, self.move_joints_diff)

    def move_arm_ik(self, req):
        assert isinstance(req, MoveArmIKRequest)
        conf = call_ik_solver(req.position, req.side, req.horizontal, req.endlink_angle,req.endeffector_offset)
        res = MoveArmIKResponse()
        if conf is None:
            res.success = False
            res.reason = 'No IK solution found'
            return res
        conf[4] = get_forward_angle_joint_5(conf[4], req.angle)
        if req.velocity_controlled:
            if req.max_speed == 0.0:
                speed = MAX_SPEED
            else:
                speed = req.max_speed
            res.success = self.go_velocity_controlled([conf], speed, wait=req.blocking)
        else:
            res.success = self.go_position_controlled([conf], wait=req.blocking)
        return res

    def execute_arm_ik_action(self, action_goal):
        assert isinstance(action_goal, MoveArmIKGoal)
        conf = call_ik_solver(action_goal.position, action_goal.side, action_goal.horizontal,action_goal.endlink_angle,
                              action_goal.endeffector_offset)
        res = MoveArmIKResult()
        if conf is None:
            res.success = False
            res.reason = 'No IK solution found'
            return res
        conf[4] = get_forward_angle_joint_5(conf[4], action_goal.angle)

        action_result = MoveArmIKResult()
        if action_goal.velocity_controlled:
            if action_goal.max_speed is 0.0:
                speed = MAX_SPEED
            else:
                speed = action_goal.max_speed
            res.success = self.go_velocity_controlled([conf], speed, wait=False)
            client = self.arm_velocity_joint_client
        else:
            res.success = self.go_position_controlled([conf], wait=False)
            client = self.arm_position_joint_client

        rate = rospy.Rate(CHECK_STATUS_RATE)
        while client.get_state() is not GoalStatus.SUCCEEDED:
            if self.arm_ik_action_server.is_preempt_requested():
                client.cancel_all_goals()
                action_result.success = False
                action_result.reason = 'Action Canceled'
                self.arm_ik_action_server.set_aborted(result=action_result)
                return
            if client.get_state() in [GoalStatus.PREEMPTED, GoalStatus.ABORTED]:
                client.cancel_all_goals()
                action_result.success = False
                action_result.reason = 'Action failed'
                self.arm_ik_action_server.set_preempted(result=action_result)
                return
            rate.sleep()
        action_result.success = True
        action_result.reason = 'Action succeeded'
        self.arm_ik_action_server.set_succeeded(result=action_result)

    def move_arm_linear(self, req):
        assert isinstance(req, MoveArmLinearRequest)
        res = MoveArmLinearResponse()
        # if len(req.points) < 2:
        #     res.success = False
        #     res.reason = 'Less than two points given'
        #     return res
        # for pose in req.points:
        #     conf = call_ik_solver(pose.position, req.side, req.horizontal)
        #     if conf is None:
        #         res.success = False
        #         res.reason = 'No IK solution found'
        #         return res
        goal = MoveArmLinearGoal()
        goal.side = req.side
        goal.horizontal = req.horizontal
        goal.points = req.points
        goal.max_speed = req.max_speed
        goal.endlink_angle = req.endlink_angle
        goal.endeffector_offset = req.endeffector_offset
        self.arm_linear_joint_client.send_goal_and_wait(goal)

        result = self.arm_linear_joint_client.get_result()
        res.success = result.success
        res.reason = result.reason
        return res

    def move_arm(self, req):
        assert isinstance(req, MoveArmRequest)
        confs = []
        for c in req.configurations:
            confs.append(configuration_to_array(c, self.configuration))
        res = MoveArmResponse()

        if req.velocity_controlled:
            if req.max_speed == 0.0:
                speed = MAX_SPEED
            else:
                speed = req.max_speed
            res.success = self.go_velocity_controlled(confs, speed, wait=req.blocking)
        else:
            res.success = self.go_position_controlled(confs, wait=req.blocking)
        return res

    def move_joints(self, req):
        assert isinstance(req, MoveJointsRequest)
        conf = configuration_to_array(req.configuration, self.configuration)
        res = MoveJointsResponse()
        if req.velocity_controlled:
            if req.max_speed == 0.0:
                speed = MAX_SPEED
            else:
                speed = req.max_speed
            res.success = self.go_velocity_controlled([conf], speed, wait=req.blocking)
        else:
            res.success = self.go_position_controlled([conf], wait=req.blocking)
        return res

    def move_joints_diff(self, req):
        assert isinstance(req, MoveJointsRequest)
        conf = configuration_to_array(req.configuration, [0.]*len(self.configuration))
        conf = np.array(self.configuration) + np.array(conf)
        res = MoveJointsResponse()
        if req.velocity_controlled:
            if req.max_speed == 0.0:
                speed = MAX_SPEED
            else:
                speed = req.max_speed
            res.success = self.go_velocity_controlled([conf], speed, wait=req.blocking)
        else:
            res.success = self.go_position_controlled([conf], wait=req.blocking)
        return res

    def go_velocity_controlled(self, joint_confs, max_speed, wait=True):
        goal = VelocityControlledJointTrajectoryGoal()
        for j in joint_confs:
            goal.configurations.append(ArmConfiguration(*j))
        goal.max_speed = max_speed
        if wait:
            if not self.arm_velocity_joint_client.send_goal_and_wait(goal, rospy.Duration(30.0), rospy.Duration(5.0)):
                return False
            rospy.loginfo("velocity controller result: %s", str(self.arm_velocity_joint_client.get_result()))
            return True
        else:
            self.arm_velocity_joint_client.send_goal(goal)
            return True

    def go_position_controlled(self, positions, wait=True):
        goal = FollowJointTrajectoryGoal()
        goal.trajectory.joint_names = [x for x in joint_names]
        goal.trajectory.points = []
        for p, count in zip(positions, range(0, len(positions) + 1)):
            goal.trajectory.points.append(JointTrajectoryPoint(positions=p,
                                                               velocities=[],
                                                               accelerations=[],
                                                               time_from_start=rospy.Duration(
                                                                   (count + 1) * self.move_duration)))
        goal.trajectory.header.stamp = rospy.get_rostime() + rospy.Duration(0.01)
        # print goal
        if wait:
            if not self.arm_position_joint_client.send_goal_and_wait(goal, rospy.Duration(30.0), rospy.Duration(5.0)):
                return False
            rospy.loginfo("position controller result: %s", str(self.arm_position_joint_client.get_result()))
            return True
        else:
            self.arm_position_joint_client.send_goal(goal)
            return True

    def tuck(self, req):
        straight = create_arm_up()
        tucked = create_tucked()
        straight[0] = self.configuration[0]
        confs = np.array([straight, tucked])
        self.go_velocity_controlled(confs, MAX_SPEED)
        return EmptyResponse()

    def untuck(self, req):
        straight = create_arm_up()
        confs = np.array([straight])
        self.go_velocity_controlled(confs, MAX_SPEED)
        return EmptyResponse()

    def joint_states_callback(self, msg):
        for k in range(len(joint_names)):
            for i in range(len(msg.name)):
                if msg.name[i] == joint_names[k]:
                    self.configuration[k] = msg.position[i]


if __name__ == '__main__':
    arm_server = 'youbot_arm_server'
    rospy.init_node(arm_server)
    arm = ArmServer()
    rospy.spin()

