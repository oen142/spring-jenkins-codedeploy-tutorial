#!/bin/bash


cd ../

if [ -d ./${ApiServer} ]; then
  rm -rf ./${ApiServer}
fi

mkdir -vp ./${ApiServer}

cp ../application-api/build/libs/* ./${ApiServer}
