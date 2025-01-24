#!/bin/bash

#echo "What are the last two numbers in the IP address of this machine?"
#
#read var
#
#echo "10.20.$var" >> test.txt

while [[ ! $confirm =~ [Yy]$ ]]
do
  read -p "Are you sure? " -n 1 -r confirm
  echo "your answer was $confirm"
done


