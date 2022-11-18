#!/usr/bin/env python

import roslib
import sys
import rospy
import cv2
import numpy as np
from multiprocessing import Process, Manager
import ctypes
from std_msgs.msg import Float64
from std_msgs.msg import String

from wecar1 import *

def run():
    rospy.init_node('line_detect', anonymous=True)

    gflag = Manager().Value(ctypes.c_int8, -100)

    run_car = Process(target=run_line_detect, args=(gflag,))
    run_car.daemon = True
    run_car.start()

    speed = rospy.Publisher('/commands/servo/speed', Float64, queue_size=1) 
    position = rospy.Publisher('/commands/servo/position', Float64, queue_size=1) 
    angle = rospy.Publisher('angle', Float64, queue_size=1) 
    """
        speed = wecar speed
        position = wecar angular

    """
    try:
        while not rospy.is_shutdown():
            steer = gflag.value
            if steer == -100:
                position_value = 0.5801
                speed_value = 0
            elif steer == -101:
                break
            elif not steer == -99:
                position_value = ((steer * np.pi) / float(180)) + 0.5801
                speed_value = 2400 - abs((steer) * 5)
                print("{0} calced_steer, {1} speed, {2} steer".format(position_value, speed_value, steer))
            else:
                position_value = 0.5801
                speed_value = 2400   
                print("{0} calced_steer, {1} speed, {2} steer".format(position_value, speed_value, steer))
            position.publish(position_value)
            speed.publish(speed_value)
            angle.publish(steer)
    except:
        run_car.join()

if __name__ == '__main__':
    run()

