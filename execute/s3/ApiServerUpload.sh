#!/bin/bash

cd ../

if [ -d ./${ApiServer} ]; then
  rm -rf ./${ApiServer}
fi

mkdir -vp ./${ApiServer}

cp ../application-api/build/libs/* ./${ApiServer}

cp ./codeDeploy/* ./${ApiServer}

cp ../appspec.yml ./${ApiServer}

cd ./${ApiServer}

zip -r ${ApiServer}.zip * -x ${ApiServer}*.sh

find ./ ! -name *.zip -exec rm {} \;

aws s3 sync ../${ApiServer} s3://${S3Bucket}/${ApiServer}

echo "s3 upload ApiServerUpload"
