#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Joy
from geometry_msgs.msg import Twist
from slaw_youbot_arm_navigation_srvs.srv import *
from std_srvs.srv import Empty
__author__ = 'daniel'

SELECT = 0
START = 3

REAR_LEFT_LOWER = 8
REAR_RIGHT_LOWER = 9
REAR_LEFT_TOP = 10
REAR_RIGHT_TOP = 11

TRIANGLE_BUTTON = 12
CIRCLE_BUTTON = 13
CROSS_BUTTON = 14
SQUARE_BUTTON = 15

RATE = 20
SCALE = 0.1
SIDES = ['front', 'left']
TOP_DOWN_START = [0.25, 0., -0.05]
HORIZONTAL_START = [0.5, 0., 0.3]
DEADMAN_BUTTON = REAR_RIGHT_TOP
SWITCH_SIDE_BUTTON = SELECT
SWITCH_HORIZONTAL = TRIANGLE_BUTTON
MOVE_ARM_START = START
GRIPPER_OPEN = CIRCLE_BUTTON
GRIPPER_CLOSE = CROSS_BUTTON
FIX_ARM = SQUARE_BUTTON

BUTTONS_USED = [SWITCH_SIDE_BUTTON, MOVE_ARM_START, GRIPPER_OPEN, GRIPPER_CLOSE, SWITCH_HORIZONTAL, FIX_ARM]

AXES_LINEAR = [1, 0, 3]  # Left joystick forward back, left right, right joystick up down
AXIS_ANGULAR = 2  # right joystick left right for angular

TIMEOUT = 0.2


class JoyArmControl(object):
    def __init__(self):
        self.arm_command_pub = rospy.Publisher('/arm_1/arm_controller/velocity_controller/arm_cartesian_control', Twist, queue_size=10)
        self.zero_send = False
        self.control_button_pressed = False
        self.arm_in_top_down = False
        self.gripper_busy = False
        self.twist_msg = Twist()
        self.side = 'left'
        self.horizontal = False
        self.arm_fixed = False
        self.buttons_pressed_before = [False] * len(BUTTONS_USED)
        self.switch_side_srv = rospy.ServiceProxy('/arm_1/arm_controller/velocity_controller/set_side', SetSide)
        self.last_joy_msg = rospy.Time.now()
        rospy.Subscriber('joy', Joy, self.joy_cb)
        rospy.Subscriber('cmd_vel', Twist, self.twist_cb)
        rospy.Timer(rospy.Duration(1. / RATE), self.publish)

    def switch_side(self, side=None):
        req = SetSideRequest()
        if side is None:
            req.side = SIDES[(SIDES.index(self.side) + 1) % len(SIDES)]
        else:
            req.side = side
        req.horizontal = self.horizontal
        try:
            self.switch_side_srv(req)
            rospy.loginfo("switched side to %s, horizontal: %s" % (req.side, str(req.horizontal)))
            self.side = req.side
            if side is None:
                self.arm_fixed = False
                self.move_arm_start()
        except rospy.ServiceException as e:
            print "Service call failed: %s" % e

    def switch_horizontal(self):
        req = SetSideRequest()
        req.horizontal = not self.horizontal
        req.side = self.side
        try:
            self.switch_side_srv(req)
            rospy.loginfo("switched horizontal to %s, side %s" % (str(req.horizontal), req.side))
            self.horizontal = req.horizontal
            self.arm_fixed = False
            self.move_arm_start()
        except rospy.ServiceException as e:
            print "Service call failed: %s" % e

    def toggle_fix_arm(self):
        self.arm_fixed = not self.arm_fixed
        if not self.arm_fixed:
            self.zero_send = False
            rospy.loginfo('arm not fixed anymore')
        else:
            self.move_arm_start()
            rospy.loginfo('arm fixed to start position')

    def move_arm_start(self):
        req = MoveArmIKRequest()
        req.side = self.side
        if self.horizontal:
            pose = HORIZONTAL_START
        else:
            pose = TOP_DOWN_START
        req.position.x = pose[0]
        req.position.y = pose[1]
        req.position.z = pose[2]
        req.velocity_controlled = True
        req.angle = 0.
        req.blocking = True
        req.horizontal = self.horizontal
        self.switch_side(side=self.side)
        rospy.wait_for_service('move_arm_ik')
        move_ik = rospy.ServiceProxy('move_arm_ik', MoveArmIK)
        try:
            response = move_ik(req)
            if response.success:
                print "move sucessful: " + str(response.reason)
            else:
                print "move failed: " + str(response.reason)
        except rospy.ServiceException as e:
            print "Service call failed: %s" % e

    def close_gripper_light(self):
        if self.gripper_busy:
            return
        self.gripper_busy = True
        rospy.wait_for_service('/close_gripper_light')
        close_gripper = rospy.ServiceProxy('/close_gripper_light', Empty)
        try:
            print ("closing gripper, light")
            close_gripper()
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e
        self.gripper_busy = False

    def close_gripper_heavy(self):
        if self.gripper_busy:
            return
        self.gripper_busy = True
        rospy.wait_for_service('/close_gripper_light')
        close_gripper = rospy.ServiceProxy('/close_gripper_light', Empty)
        try:
            close_gripper()
            print ("closing gripper, heavy")
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e
        self.gripper_busy = False

    def open_gipper(self):
        if self.gripper_busy:
            return
        self.gripper_busy = True
        rospy.wait_for_service('/open_gripper')
        open_gripper = rospy.ServiceProxy('/open_gripper', Empty)
        try:
            open_gripper()
            print ("opening gripper")
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e
        self.gripper_busy = False

    def twist_cb(self, msg):
        if self.arm_fixed:
            arm_vel = Twist()
            # TODO actual kinematics, time_dif and angular movement for now only x and y
            if self.side == 'left':
                arm_vel.linear.x = -msg.linear.y
                arm_vel.linear.y = -msg.linear.x
            # arm_vel.angular.z =
            elif self.side == 'front':
                arm_vel.linear.x = -msg.linear.x
                arm_vel.linear.y = -msg.linear.y

            self.arm_command_pub.publish(arm_vel)
            pass

    def joy_cb(self, msg):
        # Handle depressed buttons
        for idx, button in enumerate(BUTTONS_USED):
            # now pressed so set to True
            if msg.buttons[button]:
                self.buttons_pressed_before[idx] = True
            # now not pressed so if pressed before do something
            elif self.buttons_pressed_before[idx]:
                if button == SWITCH_SIDE_BUTTON:
                    self.switch_side()
                elif button == MOVE_ARM_START:
                    self.move_arm_start()
                elif button == GRIPPER_OPEN:
                    self.open_gipper()
                elif button == GRIPPER_CLOSE:
                    self.close_gripper_light()
                elif button == SWITCH_HORIZONTAL:
                    self.switch_horizontal()
                elif button == FIX_ARM:
                    self.toggle_fix_arm()
                self.buttons_pressed_before[idx] = False

        self.last_joy_msg = rospy.Time.now()
        self.control_button_pressed = msg.buttons[DEADMAN_BUTTON]
        self.twist_msg.linear.x = SCALE * msg.axes[AXES_LINEAR[0]]
        self.twist_msg.linear.y = SCALE * msg.axes[AXES_LINEAR[1]]
        self.twist_msg.linear.z = SCALE * msg.axes[AXES_LINEAR[2]]
        self.twist_msg.angular.z = SCALE * msg.axes[AXIS_ANGULAR]

    def publish(self, event):
        # print 'timer'
        if (rospy.Time.now() - self.last_joy_msg).to_sec() > TIMEOUT:
            self.control_button_pressed = False
        if self.control_button_pressed:
            self.arm_command_pub.publish(self.twist_msg)
            self.zero_send = False
        if not self.control_button_pressed and not self.zero_send:
            self.arm_command_pub.publish(Twist())
            self.zero_send = True


if __name__ == '__main__':
    rospy.init_node('JoyArmControl')
    JoyArmControl()
    rospy.spin()
