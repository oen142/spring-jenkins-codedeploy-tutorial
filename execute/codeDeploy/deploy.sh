#!/bin/bash


echo "    > AWS CodeDeploy 배포"
aws deploy create-deployment \
--application-name dreammaker-application-ApiServer \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name dreammaker-application-ApiServer \
--region ap-northeast-2 \
--s3-location bucket=${S3Bucket},bundleType=zip,key=${ApiServer}/${ApiServer}.zip