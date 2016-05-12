#!/usr/bin/env python
import rospy
import math
from slaw_youbot_arm_navigation_srvs.srv import MoveArmLinear, MoveArmLinearRequest
from slaw_youbot_arm_navigation_msgs.msg import EndeffectorPosition
from slaw_youbot_arm_navigation_utils.arm_utils import call_ik_solver
origin = [0.24, 0.]


def get_sine(a, c, x):
    ret_y = a*math.sin(c*x)
    return x, ret_y

a = 0.075
c = 12.5 * math.pi

max_x = 0.155
height = -0.14
steps = 100

srv = rospy.ServiceProxy('/move_arm_linear', MoveArmLinear)
req = MoveArmLinearRequest()
req.horizontal = False
req.side = 'left'
req.max_speed = 0.03
step = 0
for i in range(steps+1):
    pos = EndeffectorPosition()
    x, y = get_sine(a, c, step)
    step += max_x/steps
    pos.position.x = origin[0] + y
    pos.position.y = origin[1] + max_x/2. - x - 0.025
    pos.position.z = height
    print x, y, call_ik_solver(pos.position, req.side)
    req.points.append(pos)

srv.call(req)
