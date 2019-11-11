#!/bin/bash
virtualenv -p python3 ./smarthire/myenv
. ./smarthire/myenv/bin/activate
pip3 install -r requirment.txt
