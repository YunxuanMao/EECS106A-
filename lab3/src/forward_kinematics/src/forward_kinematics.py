#!/usr/bin/env python
import rospy
import numpy as np
from sensor_msgs.msg import JointState
from lab3_skeleton import lab3

def callback(message):

    #Print the contents of the message to the console
    thetas = np.array(message.position[2:8])
    print(lab3(thetas))


def fk_sub():
    rospy.init_node('fk_sub', anonymous = True)

    rospy.Subscriber('/robot/joint_states', JointState, callback)

    rospy.spin()

if __name__ == '__main__':
    fk_sub()

