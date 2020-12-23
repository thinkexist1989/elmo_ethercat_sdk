#!/bin/bash
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

CURRENT_DIR=`pwd`
echo $CURRENT_DIR


if [ "$CURRENT_DIR" != "/home/think/catkin_ws" ]
then
    echo "The shell should be run in catkin workspace"
    cd /home/think/catkin_ws
fi

echo "Source the setup.bash file"
source devel/setup.bash

echo "Which exaple do you want to run?" \
     "1. csp_example" \
     "2. cst_example" \
     "3. csv_example"

read num

if [ $num == "1" ]
then
    rosrun elmo_examples elmo_examples_csp_example src/elmo_ethercat_sdk/elmo_examples/SetupTemplate.yaml
elif [ $num == "2" ]
then
    rosrun elmo_examples elmo_examples_cst_example src/elmo_ethercat_sdk/elmo_examples/SetupTemplate.yaml
elif [ $num == "3" ]
then
    rosrun elmo_examples elmo_examples_csv_example_standalone src/elmo_ethercat_sdk/elmo_examples/SetupTemplate.yaml
fi