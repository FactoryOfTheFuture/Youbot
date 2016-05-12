#!/usr/bin/env python
import rospy
import math
from slaw_youbot_arm_navigation_srvs.srv import MoveArmLinear, MoveArmLinearRequest
from slaw_youbot_arm_navigation_msgs.msg import EndeffectorPosition

center = [0.22, 0.0]

radius = 0.05
height = -0.1
steps = 100

srv = rospy.ServiceProxy('/move_arm_linear', MoveArmLinear)
req = MoveArmLinearRequest()
req.horizontal = False
req.side = 'left'
req.max_speed = 0.05

for i in range(steps+1):
    pos = EndeffectorPosition()
    ang = i / float(steps) * 2. * math.pi
    pos.position.x = radius * math.cos(ang) + center[0]
    pos.position.y = radius * math.sin(ang) + center[1]
    pos.position.z = height
    req.points.append(pos)

srv.call(req)
