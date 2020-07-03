#!/bin/bash
sudo fuser -k 3000/tcp 7000/tcp
sudo pip3 install virtualenv 
rm -rf ./smarthire/myenv
virtualenv -p python3 ./smarthire/myenv
. ./smarthire/myenv/bin/activate

py_ver=$(python3 --version)
str_len=${#py_ver}
sub_str_len=$(expr $str_len-7)
echo ${py_ver:7:sub_str_len}
# echo ${py_ver:7:3}

sudo pip3 install -r requirment.txt --target="./smarthire/myenv/lib/python${py_ver:7:3}/site-packages/"