#!/usr/bin/env python

import roslib; roslib.load_manifest('youbot_smach')
import rospy
import smach
import smach_ros

# define state Foo
class Foo(smach.State):
	def __init__(self):
		smach.State.__init__(self, outcomes=['outcome1','outcome2'])
        	self.counter = 0

	def execute(self, userdata):
		rospy.loginfo('Executing state FOO')
        	if self.counter < 2:
            		self.counter += 1
			return 'outcome1'
		else:
			return 'outcome2'

# define state Bar
class Bar(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['outcome2'])

    def execute(self, userdata):
        rospy.loginfo('Executing state BAR')
        return 'outcome2'
      
# main
def main():
	rospy.init_node('youbot_state_machine')

	# Create a SMACH state machine
sm = smach.StateMachine(outcomes=['outcome4', 'outcome5'])

	# Open the container
with sm:
       	# Add states to the container
	smach.StateMachine.add('FOO', Foo(), transitions={'outcome1':'BAR','outcome2':'outcome4'})
	smach.StateMachine.add('BAR', Bar(), transitions={'outcome2':'FOO'})

if __name__ == '__main__':
	main()



# Create and start the introspection server
sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
sis.start()

# Execute the state machine
outcome = sm.execute()

# Wait for ctrl-c to stop the application
rospy.spin()
sis.stop()



