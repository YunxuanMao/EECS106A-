#!/usr/bin/env python
import rospy
import sys
from geometry_msgs.msg import Twist
import sys,tty,termios

# velocity
LINEAR_X = 1
# angular
ANGULAR_Z = 1

# get arrow key from keyboard
class _Getch:
    def __call__(self):
            fd = sys.stdin.fileno()
            old_settings = termios.tcgetattr(fd)
            try:
                tty.setraw(sys.stdin.fileno())
                ch = sys.stdin.read(3)
            finally:
                termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
            return ch
def get():
        inkey = _Getch()
        while(1):
            k = inkey()
            if k!='':break
        if k =='\x1b[A':
            return "up"
        elif k =='\x1b[B':
            return "down"
        elif k =='\x1b[C':
            return "right"
        elif k =='\x1b[D':
            return "left"
        elif k == 'ccc':
            return "stop"
        else:
            return "not an arrow key!"

def controller():
    rospy.init_node('controller',  anonymous=True)
    topic = sys.argv[1]+'/cmd_vel'
    pub = rospy.Publisher(topic, Twist, queue_size=10)
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        vel = Twist()

        k = get()
        print(k)
        
        if k == 'up':
            vel.linear.x = LINEAR_X
        elif k == 'down':
            vel.linear.x = -LINEAR_X
        elif k == 'right':
            vel.angular.z = -ANGULAR_Z
        elif k == 'left':
            vel.angular.z = ANGULAR_Z
        elif k == 'stop':
            break

        pub.publish(vel)
        vel.linear.x = 0
        vel.angular.z = 0
        
        rate.sleep()

if __name__ == '__main__':
    try:
        controller()
    except rospy.ROSInterruptException: pass