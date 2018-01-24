#!/bin/bash

Launch=/home/lucky/workspace/launch/orb_slam.launch
Send_Launch=/home/lucky/workspace/launch/send_dataset.launch
Dir=/home/lucky/dataset/

result=$(ls $Dir)

var=0
array=()

for i in $result
do
	echo $var" "$i
	array[$var]=$i
	((var++))
done

echo "enter your chosen:"
read input

dataset=${array[$input]}
Dir=$Dir$dataset
result=$(ls $Dir)

var=0
array=()

for i in $result
do
	echo $var" "$i
	array[$var]=$i
	((var++))
done

echo "enter your chosen:"
read input

rm -rf /home/lucky/pcd/tmppcd/*
rm -rf bag.log

Sequence=${array[$input]}

{
	sleep 9
	roslaunch  $Send_Launch dataset:=$dataset sequence:=$Sequence
}&

roslaunch $Launch 2>&1 | tee bag.log


