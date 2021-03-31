#!/bin/bash
BUILD_PATH=$(ls /home/ec2-user/ApiServer/*.jar)
JAR_NAME=$(basename $BUILD_PATH)
echo "> build 파일명 : $JAR_NAME"

echo ">  build 파일 복사"
DEPLOY_PATH=/home/ec2-user/
cp $BUILD_PATH $DEPLOY_PATH
