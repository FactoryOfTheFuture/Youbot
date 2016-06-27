#!/usr/bin/env python
import rospy
from slaw_youbot_arm_navigation_srvs.srv import SimpleIkSolver, SimpleIkSolverRequest, SimpleIkSolverResponse
from slaw_youbot_arm_navigation_utils.ik_solver import calculate_ik_solution


if __name__ == "__main__":
    rospy.init_node("simple_ik_solver")
    # rospy.sleep(0.1)
    rospy.Service('/arm_1/simple_ik_server', SimpleIkSolver, calculate_ik_solution)
    rospy.spin()
