#!/bin/bash

    rosservice call /reset
    rosservice call /kill turtle1

    
     rosservice call /spawn 1.0 8.0 0.8 turtle1

     rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -3]'
     rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
     rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, 2.2]'
     rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[1.3, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
     

    
     rosservice call /spawn 2.3 8.2 4.7 turtle4

     rostopic pub -1 /turtle4/cmd_vel geometry_msgs/Twist -- '[1.35, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
     rostopic pub -1 /turtle4/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, 1.57]'
     rostopic pub -1 /turtle4/cmd_vel geometry_msgs/Twist -- '[1.3, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
     rostopic pub -1 /turtle4/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, 1.55]'
     rostopic pub -1 /turtle4/cmd_vel geometry_msgs/Twist -- '[1.35, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
    rostopic pub -1 /turtle4/cmd_vel geometry_msgs/Twist -- '[-2.7, 0.0, 0.0]' '[0.0, 0.0, 0.0]'

     

   
    rosservice call /spawn 4.0 8.0 0.8 turtle3

    rostopic pub -1 /turtle3/cmd_vel geometry_msgs/Twist -- '[2.12, 1.0, 0.0]' '[0.0, 0.0, -3.14]'
    rostopic pub -1 /turtle3/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, 1.7]'
    rostopic pub -1 /turtle3/cmd_vel geometry_msgs/Twist -- '[2.8, 0.0, 0.0]' '[0.0, 0.0, -3.5]'

    

   
    rosservice call /spawn 5.95 8.2 0.0 turtle9

    rostopic pub -1 /turtle9/cmd_vel geometry_msgs/Twist -- '[5.3, 0.0, 0.0]' '[0.0, 0.0, -7.83]'
    rostopic pub -1 /turtle9/cmd_vel geometry_msgs/Twist -- '[1.3, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
    rostopic pub -1 /turtle9/cmd_vel geometry_msgs/Twist -- '[1.59, 0.0, 0.0]' '[0.0, 0.0, -2.35]'

    

   
    rosservice call /spawn 6.8 7.525 1.57 turtle0
   
    rostopic pub -1 /turtle0/cmd_vel geometry_msgs/Twist -- '[2.12, 0.0, 0.0]' '[0.0, 0.0,-3.13]'
    rostopic pub -1 /turtle0/cmd_vel geometry_msgs/Twist -- '[1.2, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
    rostopic pub -1 /turtle0/cmd_vel geometry_msgs/Twist -- '[2.12, 0.0, 0.0]' '[0.0, 0.0,-3.13]'
    rostopic pub -1 /turtle0/cmd_vel geometry_msgs/Twist -- '[1.2, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
   
   

    rosservice call /spawn 8.5 8.2 0.0 turtle7

    rostopic pub -1 /turtle7/cmd_vel geometry_msgs/Twist -- '[1.3, 0.0, 0.0]' '[0.0, 0.0, -0.0]'
    rostopic pub -1 /turtle7/cmd_vel geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -2.1]'
    rostopic pub -1 /turtle7/cmd_vel geometry_msgs/Twist -- '[2.9, 0.0, 0.0]' '[0.0, 0.0, 0.0]'
    
    rosservice call /kill turtle1
    rosservice call /kill turtle4
    rosservice call /kill turtle3
    rosservice call /kill turtle9
    rosservice call /kill turtle0
    rosservice call /kill turtle7
echo"Done"
