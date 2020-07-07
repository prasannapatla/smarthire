#!/bin/bash
sudo fuser -k 3000/tcp 7000/tcp
clear
. ./smarthire/myenv/bin/activate
python3 smarthire/manage.py makemigrations
python3 smarthire/manage.py migrate
python3 smarthire/manage.py runserver 7000
