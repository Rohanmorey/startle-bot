#!/bin/bash
 
my_pid=$$
echo "My process ID is $my_pid"

echo "Launching roscore..."
roscore &
pid=$!
sleep 5s

echo "Launching Gazebo..."
roslaunch startle_gazebo startle_world.launch &
pid="$pid $!"

sleep 5s

echo "Launching navigation stack..."
 roslaunch startle_navigation startle_navigation.launch &
pid="$pid $!"

sleep 3s



trap "echo Killing all processes.; kill -2 TERM $pid; exit" SIGINT SIGTERM

sleep 24h
