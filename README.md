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


