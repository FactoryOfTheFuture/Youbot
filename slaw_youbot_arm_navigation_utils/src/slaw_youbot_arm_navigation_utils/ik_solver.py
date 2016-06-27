#!/usr/bin/env python
import rospy
import math
from geometry_msgs.msg import Point
from slaw_youbot_arm_navigation_srvs.srv import SimpleIkSolverRequest, SimpleIkSolverResponse

joints = rospy.get_param('joints')
max_reach_triangle = joints['arm_joint_2']['length'] + joints['arm_joint_3']['length']
last_link_length = joints['arm_joint_4']['length'] + joints['arm_joint_5']['length']
height_diff = joints['arm_joint_1']['height'] - last_link_length
arm_rot_offset = rospy.get_param('arm_rot_offset')
joint_names = rospy.get_param("joint_names")
arm_base_link = rospy.get_param("arm_base_link")


def calculate_ik_solution(req):
    assert isinstance(req, SimpleIkSolverRequest)
    point_stamped = req.point
    response = SimpleIkSolverResponse()
    if not point_stamped.header.frame_id == arm_base_link:
        return response
    offset = 0
    point = point_stamped.point
    if req.position == 'back':
        offset = math.pi
        # point.x *= -1
        # point.y *= -1

    if req.position == 'left':
        offset = math.pi / 2
        # tmp = point.x
        # point.x = point.y
        # point.y = -tmp

    if req.position == 'right':
        offset = -math.pi / 2
        # tmp = point.x
        # point.x *= -point.y
        # point.y *= tmp

    # print point
    conf = calc_joints_for_point(point, offset, req.horizontal, req.endlink_angle, req.endeffector_offset)

    # print conf
    if conf is not None:
        response.joints = tuple(conf)
    return response


def calc_joints_for_point(point, offset=0.0, horizontal=False, endlink_angle=0.0, endeffector_offset=0.0):
    height = point.z
    projected_distance = math.sqrt(point.x * point.x + point.y * point.y)
    try:
        if horizontal:
            endlink_angle = math.pi / 2.

        conf = calc_joints_for_height_and_projected_distance(projected_distance, height, endlink_angle,
                                                             endeffector_offset=endeffector_offset)
        angle = math.atan2(point.y, point.x)

        # rotate joint 1 and 5 for angle
        conf['arm_joint_1'] -= angle + offset + arm_rot_offset

        # TODO check if this makes sense
        if abs(endlink_angle) < math.pi / 8.:
            conf['arm_joint_5'] = limit_joint_5(conf['arm_joint_5'] - angle)

        if check_conf(conf):
            return dict_to_conf(conf)

    except Exception, e:
        print "Error:", e
        return None

    return None


def calc_joints_for_height_and_projected_distance(projected_distance, height, endlink_angle=0.,
                                                  endeffector_offset=0.0):
    joint_2_direction = 1
    height_diff = height - joints['arm_joint_1']['height'] + math.cos(endlink_angle) \
                                                             * (last_link_length + endeffector_offset)
    projected_distance -= joints['arm_joint_1']['front_offset'] \
                          + math.sin(endlink_angle) * (last_link_length + endeffector_offset)
    triangle_dist = math.sqrt(projected_distance * projected_distance + height_diff * height_diff)

    # cannot reach further than sum of joint 2 and 3
    if triangle_dist > max_reach_triangle:
        return None
    config = calc_joints_for_triangle_dist(triangle_dist)

    # extra angles for height difference of triangle
    offset_joint_2, offset_joint_4 = calc_triangle_rotation_angles(triangle_dist, height_diff, endlink_angle)

    compensate_negative = 0.
    if projected_distance < 0:
        # compensate_negative = joints['arm_joint_2']['straight'] - offset_joint_4
        compensate_negative = math.pi / 2. - offset_joint_4
    config['arm_joint_1'] = joints['arm_joint_1']['straight']

    config['arm_joint_2'] = joints['arm_joint_2']['straight'] + (math.pi / 2 - offset_joint_2) \
                            - config['arm_joint_2'] + 2. * compensate_negative
    config['arm_joint_3'] = joints['arm_joint_3']['straight'] + (math.pi - config['arm_joint_3'])
    config['arm_joint_4'] = joints['arm_joint_4']['straight'] + (math.pi - offset_joint_4) - config[
        'arm_joint_4'] - 2. * compensate_negative

    config['arm_joint_5'] = joints['arm_joint_5']['straight']

    return config


def calc_triangle_rotation_angles(triangle_dist, height_diff, endlink_angle):
    c = triangle_dist  # - joints['arm_joint_1']['front_offset']
    a = height_diff
    offset_joint_2 = math.asin(a / c)
    offset_joint_4 = math.pi / 2.0 - offset_joint_2
    offset_joint_4 += endlink_angle
    return offset_joint_2, offset_joint_4


def calc_joints_for_triangle_dist(triangle_dist):
    if triangle_dist == max_reach_triangle:
        config = {}
        config['arm_joint_2'] = 0
        config['arm_joint_3'] = math.pi
        config['arm_joint_4'] = 0
        return config
    a = joints['arm_joint_2']['length']
    b = joints['arm_joint_3']['length']
    c = triangle_dist

    alpha = math.acos((b * b + c * c - a * a) / (2 * b * c))
    beta = math.acos((a * a + c * c - b * b) / (2 * a * c))
    gamma = math.pi - alpha - beta

    config = {}
    config['arm_joint_2'] = beta
    config['arm_joint_3'] = gamma
    config['arm_joint_4'] = alpha
    return config


def dict_to_conf(confDict):
    conf = []
    conf.append(confDict['arm_joint_1'])
    conf.append(confDict['arm_joint_2'])
    conf.append(confDict['arm_joint_3'])
    conf.append(confDict['arm_joint_4'])
    conf.append(confDict['arm_joint_5'])
    return conf


def check_conf(conf_dict):
    for name, val in conf_dict.items():
        if val < joints[name]['min'] or val > joints[name]['max']:
            return False
    return True


def get_min_max_dist_for_height(height, start=0.2, step=0.001):
    point = Point()
    point.x = start
    point.y = 0
    point.z = height
    while calc_joints_for_point(point) is not None:
        point.x -= step
    min_dist = point.x + step

    point.x = start
    while calc_joints_for_point(point) is not None:
        point.x += step
    max_dist = point.x - step
    return min_dist, max_dist


def limit_joint_5(value):
    if value < joints['arm_joint_5']['min']:
        return value + math.pi
    if value > joints['arm_joint_5']['max']:
        return value - math.pi
    return value
