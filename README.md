# slaw_youbot_arm_navigation

This ROS package is a simple youbot arm navigation method. It uses a geometric inverse kinematics solver
and a simple ROS service interface to control the arm. You can easily move the arm to certain positions.

It provides a simple rviz based simulation of the arm to have visual checks, but it can also be run on the actual robot
with no changes at all.

**NOTE**: This does not do any (self-) collision checks. So be sure to be able to stop the arm
at any moment and only use it to go to points that are collision free!


## Installation
Change to your catkin workspace src directory, usually its:
```
cd ~/catkin_ws/src
```
Checkout this repository:
```
git clone https://github.com/smARTLab-liv/slaw_youbot_arm_navigation.git
```
Install dependencies:
```
rosdep install --from-paths src --ignore-src --rosdistro indigo
```
catkin_make your workspace:
```
cd ~/catkin_ws/src
catkin_make
```

## RVIZ based "simulation"
Launch
```
roslaunch slaw_youbot_arm_navigation_utils fake_arm_navigation.launch
```
This should show a youbot in rviz with a single arm, rotated 45 degrees to the left.
You can test if the services work:
```
rosservice call /untuck_arm
```
and
```
rosservice call /tuck_arm
```
Also some more fancy movements can be performed
```
rosrun slaw_youbot_arm_navigation_utils follow_sine.py
rosrun slaw_youbot_arm_navigation_utils follow_circle.py
```

The arm can also be controlled via service calls:
```
rosservice call /move_arm_ik "position: {x: 0.25, y: 0.0, z: -0.10}
angle: 0.0
velocity_controlled: true
side: 'left'
endlink_angle: 0.0
horizontal: false
blocking: false
endeffector_offset: 0.0
max_speed: 0.0"
```
Description of the params:
*position*: is the endeffector position from the arm center point in the base.

*angle*: is the rotation angle of the last joint

*velocity_controlled*: true: try a smooth motion, i.e. all joints move the whole time,
false: go with the maximum speed of all joints.

*side*: "left", "right", "front", or "back": which side of the arm is considered front.

*endlink_angle*: the angle of the second-last joint. Needed to increase range in top-down mode

*horizontal*: horizontal if true, or top-down if false.

*blocking*: directly return, or block until the movement is completed

*endeffector_offset*: extra length for the endeffector. (i.e. if a tool is in the gripper)

*max_speed*: max speed for velocity controlled mode.