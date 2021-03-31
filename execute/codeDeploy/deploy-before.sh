#!/bin/bash

if [ -d /home/ec2-user/ApiServer ]; then
  rm -rf /home/ec2-user/ApiServer
fi

mkdir -vp /home/ec2-user/ApiServer