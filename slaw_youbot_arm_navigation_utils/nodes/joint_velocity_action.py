#!/usr/bin/env python
import numpy as np
import actionlib
import rospy
from brics_actuator.msg import JointVelocities, JointPositions, JointValue
from geometry_msgs.msg import Point, Twist
from sensor_msgs.msg import JointState
from slaw_youbot_arm_navigation_actions.msg import *
from slaw_youbot_arm_navigation_srvs.srv import SetSide, SetSideResponse
from slaw_youbot_arm_navigation_utils.arm_utils import joint_names, limit_joint_5, limit_joint, create_null_velocity, \
    forward_kinematics, create_arm_up, get_forward_angle_joint_5, call_ik_solver, configuration_to_array

LIMIT_OVER_EFFORT = 2
ARM_MOVING_THRESHOLD = 0.001

THRESHOLD_CARTESIAN_MOVEMENT = 0.002

THRESHOLD_LINEAR_MOVEMENT = 0.01
THRESHOLD_ANGULAR_MOVEMENT = 0.01
MAX_DIST_LIN_SPEEDS = 0.01
NORMAL_SPEED = 1.

MAX_SPEED_JOINT_5 = 0.5


def cartesian_vel_to_joint_vel(vel, angular_speed, current_configuration, side, horizontal, endlink_angle, endeffector_offset):

    cur_pos, cur_ang, ret_endlink_angle = np.array(forward_kinematics(current_configuration, side, horizontal, return_endlink_angle=True, endeffector_offset=endeffector_offset))
    cur_point = Point(*cur_pos)
    cur_target_joints = call_ik_solver(cur_point, side, horizontal, endlink_angle, endeffector_offset)
    if cur_target_joints is None:
        return np.array([0.] * len(joint_names))
    cur_target_joints[4] -= cur_ang

    cart_speed = np.linalg.norm(vel)
    if cart_speed > MAX_DIST_LIN_SPEEDS:
        scale = MAX_DIST_LIN_SPEEDS / np.linalg.norm(vel)
    else:
        scale = 1
    target_vector = cur_pos + scale * vel
    goal = Point(*list(target_vector))
    target_joints = call_ik_solver(goal, side, horizontal, endlink_angle, endeffector_offset)
    if target_joints is not None:
        target_joints[4] = limit_joint_5(target_joints[4] - cur_ang)
        joint_velocities = (target_joints - np.array(current_configuration)) / scale
        joint_velocities[4] -= angular_speed
        # print joint_velocities[4]
        return joint_velocities
    else:
        return (cur_target_joints - np.array(current_configuration)) / scale


def get_current_joint_velocities(target, max_speed, speed_scale_joints, current_configuration, current_joint_velocities,
                                 unit, intermediate=False):
    msg = create_null_velocity(unit)
    direction = np.array(target) - np.array(current_configuration)

    target_speed = speed_scale_joints * direction

    max_val = np.max(abs(target_speed))
    if max_val > max_speed:  # or intermediate:
        target_speed = target_speed / max_val * max_speed

    # if intermediate and max_val < max_speed:
    #    target_speed = target_speed / max_val * (max_speed - math.pow(max_speed-max_val, 2))
    #    print (max_speed - math.pow(max_speed-max_val, 2))

    speed_error = np.abs(target_speed - current_joint_velocities)
    # joint_0_speed = target_speed[0]

    max_joint_speed_errors = np.array([0.25, 0.25, 0.25, .25, .25])
    max_joint_speed_errors *= 3

    diff = speed_error - max_joint_speed_errors
    max_error = np.max(diff)

    if max_error > 0:
        idx = np.where(diff == max_error)
        target_speed *= max_joint_speed_errors[idx[0][0]] / speed_error[idx[0][0]]
        # target_speed[0] = joint_0_speed

    for j, val in zip(msg.velocities, target_speed):
        j.value = val
    return msg


class JointVelocityController:
    def __init__(self):
        rospy.on_shutdown(self.shutdown_hook)
        self.received_state = False

        self.speed_scale_joints = rospy.get_param("speed_scale_joints", 1.5)
        if not rospy.has_param("joint_names"):
            rospy.logerr("No joints given.")
            exit(0)
        rospy.loginfo("Joints: %s", joint_names)

        self.configuration = [0 for i in range(len(joint_names))]
        self.efforts = [0 for i in range(len(joint_names))]
        self.joint_velocities = np.array([0.0 for i in range(len(joint_names))])

        self.unit = rospy.get_param("~unit", 's^-1 rad')
        rospy.loginfo("Unit: %s", self.unit)

        self.goal_diffs = rospy.get_param("constraints")
        self.max_effort = rospy.get_param("max_effort")

        self.counter = 0
        # how often does the correct reading have to be there
        self.goal_success = 1  # rospy.get_param("goal_success", 2)

        self.velocity_pub = rospy.Publisher("velocity_command", JointVelocities, queue_size=10)
        self.position_pub = rospy.Publisher("position_command", JointPositions, queue_size=10)

        self.side = 'left'
        self.horizontal = False
        rospy.Service("~set_side", SetSide, self.set_side_cb)

        self.velocity_action_server = actionlib.SimpleActionServer("joint_velocity_action",
                                                                   VelocityControlledJointTrajectoryAction,
                                                                   self.execute_velocity_action, False)

        self.linear_action_server = actionlib.SimpleActionServer("follow_linear_positions",
                                                                 MoveArmLinearAction,
                                                                 self.execute_linear_action, False)

        self.velocity_action_server.start()
        self.linear_action_server.start()

        # subscriptions
        rospy.Subscriber("/joint_states", JointState, self.joint_states_callback)
        rospy.Subscriber("~arm_cartesian_control", Twist, self.arm_cartesian_cb)

    def get_linear_movement_msg(self, target_pose, target_ang, max_speed, side, horizontal=False, endlink_angle=0.0,
                                endeffector_offset=0.0):
        cur_pos, cur_ang, ret_endlink_angle = forward_kinematics(self.configuration, side, horizontal, return_endlink_angle=True, endeffector_offset=endeffector_offset)

        direction = np.array(target_pose) - np.array(cur_pos)
        angular_speed = (target_ang - cur_ang)
        distance = 1.5 * np.linalg.norm(direction)
        # if distance > max_speed:
        direction *= max_speed / distance

        angular_speed *= max_speed / distance
        # else distance < max_speed:
        angular_speed = max(min(max_speed, angular_speed), -max_speed)

        target_speeds = cartesian_vel_to_joint_vel(direction, angular_speed, self.configuration, side, horizontal,
                                                   endlink_angle, endeffector_offset)

        if abs(target_speeds[4]) > MAX_SPEED_JOINT_5:
            target_speeds[4] = MAX_SPEED_JOINT_5

        msg = create_null_velocity(self.unit)
        for j, val in zip(msg.velocities, target_speeds):
            j.value = val
        return msg

    def execute_linear_action(self, goal):
        assert isinstance(goal, MoveArmLinearGoal)
        over_effort_counter = 0
        rate = rospy.Rate(50)
        result = MoveArmLinearResult()
        side = goal.side
        horizontal = goal.horizontal
        endlink_angle = goal.endlink_angle
        max_speed = goal.max_speed
        endeffector_offset = goal.endeffector_offset
        if max_speed < ARM_MOVING_THRESHOLD:
            result.success = False
            result.reason = 'Max speed is lower than arm moving threshold'
            self.linear_action_server.set_preempted(result)
            return

        if len(goal.points) < 2:
            result.success = False
            result.reason = 'Less than two points given'
            self.linear_action_server.set_preempted(result)
            return
        for target_pose in goal.points:
            conf = call_ik_solver(target_pose.position, goal.side, horizontal=goal.horizontal,
                                  endlink_angle=endlink_angle, endeffector_offset=endeffector_offset)
            if conf is None:
                result.success = False
                result.reason = 'No IK solution found'
                self.linear_action_server.set_preempted(result)
                return

        first_conf = call_ik_solver(goal.points[0].position, goal.side, horizontal=goal.horizontal,
                                    endlink_angle=endlink_angle, endeffector_offset=endeffector_offset)
        first_conf[4] = limit_joint_5(first_conf[4] - goal.points[0].angle)

        last_conf = call_ik_solver(goal.points[-1].position, goal.side, horizontal=goal.horizontal,
                                   endlink_angle=endlink_angle, endeffector_offset=endeffector_offset)
        last_conf[4] = limit_joint_5(last_conf[4] - goal.points[-1].angle)

        if not self.go_velocity_controlled([first_conf], NORMAL_SPEED, action_server=self.linear_action_server):
            result.success = False
            result.reason = 'Stopped while going to first conf'
            self.linear_action_server.set_aborted(result)
            self.stop_arm()
            return

        for endeffector_pose in goal.points:
            target_pose = [endeffector_pose.position.x, endeffector_pose.position.y, endeffector_pose.position.z]
            target_ang = endeffector_pose.angle
            print target_pose
            while not rospy.is_shutdown():
                if self.is_over_effort():
                    over_effort_counter += 1
                    rospy.logerr("%d, over effort", over_effort_counter)
                    if over_effort_counter > LIMIT_OVER_EFFORT:
                        result.success = False
                        rospy.logerr("arm over-effort")
                        result.reason = "arm over effort"
                        self.arm_up_recover()
                        self.linear_action_server.set_preempted(result)
                        return
                if self.linear_action_server.is_preempt_requested():
                    self.stop_arm()
                    result.success = False
                    result.reason = 'Action aborted'
                    self.linear_action_server.set_aborted(result)
                    return

                cur_pose, cur_ang = forward_kinematics(self.configuration, side, horizontal, endlink_angle, endeffector_offset)

                if np.linalg.norm(np.array(cur_pose) - np.array(target_pose)) < THRESHOLD_LINEAR_MOVEMENT \
                        and abs(cur_ang - target_ang) < THRESHOLD_ANGULAR_MOVEMENT:
                    break
                msg = self.get_linear_movement_msg(target_pose, target_ang, max_speed, side, horizontal=horizontal,
                                                   endlink_angle=endlink_angle,
                                                   endeffector_offset=endeffector_offset)
                self.velocity_pub.publish(msg)
                rate.sleep()

        if not self.go_velocity_controlled([last_conf], NORMAL_SPEED, action_server=self.linear_action_server):
            result.success = False
            result.reason = 'Stopped while going to last conf'
            self.linear_action_server.set_aborted(result)
            self.stop_arm()
            return

        self.stop_arm()
        result.success = True
        result.reason = 'Movement Succeeded'
        self.linear_action_server.set_succeeded(result)

    def go_velocity_controlled(self, joint_confs, max_speed, action_server=None):
        rate = rospy.Rate(50)
        for joint_conf in joint_confs:
            while not rospy.is_shutdown():
                if self.is_goal_reached(joint_conf, self.configuration):
                    break
                if action_server is not None and action_server.is_preempt_requested():
                    return False
                msg = get_current_joint_velocities(joint_conf, max_speed, self.speed_scale_joints, self.configuration,
                                                   self.joint_velocities, self.unit)
                self.velocity_pub.publish(msg)
                rate.sleep()

        self.stop_arm()
        return True

    def execute_velocity_action(self, goal):
        over_effort_counter = 0
        rate = rospy.Rate(50)
        result = VelocityControlledJointTrajectoryResult()
        max_speed = goal.max_speed
        if max_speed < ARM_MOVING_THRESHOLD:
            result.success = False
            result.reason = 'Max speed is lower than arm moving threshold'
            self.velocity_action_server.set_preempted(result)
            return

        for idx, configuration_msg in enumerate(goal.configurations):
            joint_conf = configuration_to_array(configuration_msg, self.configuration)
            intermediate = idx < len(goal.configurations) - 1
            while not rospy.is_shutdown():
                if self.is_over_effort():
                    over_effort_counter += 1
                    rospy.logerr("%d, over effort", over_effort_counter)
                    if over_effort_counter > LIMIT_OVER_EFFORT:
                        result.success = False
                        rospy.logerr("arm over-effort")
                        result.reason = "arm over effort"
                        self.arm_up_recover()
                        self.velocity_action_server.set_preempted(result)
                        return
                if self.velocity_action_server.is_preempt_requested():
                    self.stop_arm()
                    result.success = False
                    result.reason = 'Action aborted'
                    self.velocity_action_server.set_aborted(result)
                    return
                if self.is_goal_reached(joint_conf, self.configuration, intermediate=intermediate):
                    break
                msg = get_current_joint_velocities(joint_conf, max_speed, self.speed_scale_joints, self.configuration,
                                                   self.joint_velocities, self.unit, intermediate=intermediate)
                self.velocity_pub.publish(msg)
                rate.sleep()
        self.stop_arm()
        result.success = True
        result.reason = 'Movement Succeeded'
        self.velocity_action_server.set_succeeded(result)

    def arm_cartesian_cb(self, msg):
        speed = np.array([msg.linear.x, msg.linear.y, msg.linear.z])
        angular_speed = msg.angular.z
        target_speeds = cartesian_vel_to_joint_vel(speed, angular_speed, self.configuration, self.side, self.horizontal,
                                                   endlink_angle=0.2,
                                                   endeffector_offset=0.0)
        print target_speeds
        msg = create_null_velocity(self.unit)
        if np.linalg.norm(target_speeds) < THRESHOLD_CARTESIAN_MOVEMENT:
            self.stop_arm()
            return

        if np.linalg.norm(speed) + abs(angular_speed) < THRESHOLD_CARTESIAN_MOVEMENT:
            self.stop_arm()
            return

        for j, val in zip(msg.velocities, target_speeds):
            j.value = val
        self.velocity_pub.publish(msg)

    def joint_states_callback(self, msg):
        for k in range(len(joint_names)):
            for i in range(len(msg.name)):
                if msg.name[i] == joint_names[k]:
                    self.configuration[k] = msg.position[i]
                    self.joint_velocities[k] = msg.velocity[i]
                    if len(msg.effort) > i:
                        self.efforts[k] = abs(msg.effort[i])
                        if self.efforts[k] > self.max_effort:
                            rospy.logerr("joint %d over effort with (%f)", k, self.efforts[k])
        self.received_state = True

    def is_over_effort(self):
        for idx, effort in enumerate(self.efforts):
            if abs(effort) > self.max_effort:
                rospy.logerr("joint %d Over Voltage (%f)", idx + 1, effort)
                return True
        return False

    def is_goal_reached(self, goal, conf, intermediate=False):
        if intermediate:
            for i in range(len(joint_names)):
                if abs(goal[i] - conf[i]) > self.goal_diffs['intermediate_dif']:
                    return False
            return True

        for i in range(len(joint_names)):
            if abs(goal[i] - conf[i]) > self.goal_diffs['goal_dif']:
                self.counter = 0
                return False
        self.counter += 1
        if self.counter > self.goal_success:
            self.counter = 0
            return True
        else:
            return False

    def set_side_cb(self, req):
        res = SetSideResponse()
        if req.side in ['front', 'back', 'left', 'right']:
            self.side = req.side
            res.result = 'Set side to ' + self.side + " horizontal: " + str(req.horizontal)
            self.horizontal = req.horizontal
        else:
            res.result = 'Side not known: ' + req.side + 'valid are front, left, right and back'
        return res

    def arm_up_recover(self):
        arm_up = create_arm_up()
        arm_up[0] = self.configuration[0]
        arm_up[4] = self.configuration[4]

        joint_positions = JointPositions()

        # transform from ROS to BRICS message
        for j in range(len(joint_names)):
            joint_value = JointValue()
            joint_value.joint_uri = joint_names[j]
            joint_value.value = limit_joint(joint_names[j], arm_up[j])
            joint_value.unit = self.unit
            joint_positions.positions.append(joint_value)
        self.position_pub.publish(joint_positions)
        rospy.sleep(1)

    def shutdown_hook(self):
        self.stop_arm()

    def stop_arm(self):
        rate = rospy.Rate(50)
        self.velocity_pub.publish(create_null_velocity(self.unit))
        while np.sum(np.abs(self.joint_velocities)) > ARM_MOVING_THRESHOLD:
            self.velocity_pub.publish(create_null_velocity(self.unit))
            rate.sleep()


if __name__ == "__main__":
    rospy.init_node("joint_velocity_controller_action")
    rospy.sleep(0.1)
    action = JointVelocityController()
    rospy.spin()
    action.shutdown_hook()
