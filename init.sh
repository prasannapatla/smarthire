#!/bin/bash
sudo pip3 install virtualenv 
virtualenv -p python3 ./smarthire/myenv
. ./smarthire/myenv/bin/activate
pip3 install -r requirment.txt
