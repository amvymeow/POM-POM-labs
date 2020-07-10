#!/usr/bin/env python

import rospy
import time
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from math import pow, atan2, sqrt

class stalker:

    distance_tolerance = 1
    alpha = 0
    A = []

    def __init__(self):
        # Creates a node with
        rospy.init_node('stalker')
	
        # Publisher which will publish to the topic '/cmd_vel'.
        self.velocity_publisher = rospy.Publisher('/robot_1/cmd_vel', Twist, queue_size=10)

	self.scan_subscriber = rospy.Subscriber('/robot_1/base_scan', LaserScan, self.update_scan)

	self.pose_subscriber = rospy.Subscriber('/robot_1/base_pose_ground_truth', Odometry, self.update_pose)

	self.goal_subscriber = rospy.Subscriber('/robot_0/base_pose_ground_truth', Odometry, self.update_goal)

        self.scan = LaserScan()
	self.goal = Odometry()
	self.pose = Odometry()

        for i in range(18):
            self.scan.ranges.append(0.001)
        self.rate = rospy.Rate(10)
    
    def update_scan(self, data):
        """Callback function which is called when a new message of type LaserScan is
        received by the subscriber."""
        self.scan = data
	
	right=min(self.scan.ranges[0:6])
	forward=min(self.scan.ranges[6:12])
	left=min(self.scan.ranges[12:18])
	self.scan.ranges = [right, forward, left]
	print (right, forward, left)

    def update_goal(self, data1):
	self.goal = data1

    def update_pose(self, data2):
	self.pose = data2
	
    def func(self):
	while not rospy.is_shutdown:
	    time.sleep(2)

    def euclidean_distance(self):
        """Euclidean distance between current pose and the goal."""
        return sqrt(pow((self.goal.pose.pose.position.x -self.pose.pose.pose.position.x), 2) +
                    pow((self.goal.pose.pose.position.y - self.pose.pose.pose.position.y), 2))

    def steering_angle(self):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return atan2(self.goal.pose.pose.position.y - self.pose.pose.pose.position.y, self.goal.pose.pose.position.x -self.pose.pose.pose.position.x)

	
    def move2goal(self, linear_constant=1.5, angular_constant=6):
	while not rospy.is_shutdown:

        # Please, insert a number slightly greater than 0 (e.g. 0.01).
        	distance_tolerance = 1

        	vel_msg = Twist()

        	while self.euclidean_distance() >= distance_tolerance:

            # Porportional controller.
            # https://en.wikipedia.org/wiki/Proportional_control

            # Linear velocity in the x-axis.
            		vel_msg.linear.x = linear_constant*self.euclidean_distance()
            		vel_msg.linear.y = 0
            		vel_msg.linear.z = 0

            # Angular velocity in the z-axis.
            		vel_msg.angular.x = 0
            		vel_msg.angular.y = 0
            		vel_msg.angular.z = angular_constant*(self.steering_angle()-self.pose.pose.pose.orentation.z)

            # Publishing our vel_msg
            		self.velocity_publisher.publish(vel_msg)

            # Publish at the desired rate.
           	 	self.rate.sleep()

        # Stopping our robot after the movement is over.
        		vel_msg.linear.x = 0
        		vel_msg.angular.z = 0
        		self.velocity_publisher.publish(vel_msg)

if __name__ == '__main__':
    try:
	#rospy.wait_for_message('/base_scan', 'sensor_msgs')???
	x = stalker()
	x.move2goal()
    except rospy.ROSInterruptException:
        pass
