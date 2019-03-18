#!/bin/bash

# in circle ci $BASH_ENV is automatically set
# for local usage use the local script

echo 'export VERSION=$CIRCLE_SHA1 ' >> $BASH_ENV
echo 'export BRANCH=$CIRCLE_BRANCH ' >> $BASH_ENV

if [ $CIRCLE_BRANCH = master ]
then

target="prod"
echo 'export UI_ENDPOINT_APP="https://baufinanzieren-rosenheim.de/" ' >> $BASH_ENV
echo 'export UI_ENDPOINT_MANAGEMENT="https://management.laura-ai.de" ' >> $BASH_ENV

elif [ $CIRCLE_BRANCH = develop ]
then

target="dev"
echo 'export UI_ENDPOINT_APP="https://staging.laura-ai.de/" ' >> $BASH_ENV
echo 'export UI_ENDPOINT_MANAGEMENT="https://management.staging.laura-ai.de" ' >> $BASH_ENV

else 
# current default is staging
target="dev"
echo 'export UI_ENDPOINT_APP="https://staging.laura-ai.de/" ' >> $BASH_ENV
echo 'export UI_ENDPOINT_MANAGEMENT="https://management.staging.laura-ai.de" ' >> $BASH_ENV

fi


echo "export CLOUD_ENDPOINT_CMS=https://cms.$target.cloud.laura-ai.de/ " >> $BASH_ENV
echo "export CLOUD_ENDPOINT_DIALOGFLOW=https://dialogflow.$target.cloud.laura-ai.de/ " >> $BASH_ENV
echo "export CLOUD_ENDPOINT_PDF=https://pdf.$target.cloud.laura-ai.de/ " >> $BASH_ENV
echo "export CLOUD_ENDPOINT_CRAWLER=https://crawler.$target.cloud.laura-ai.de/ " >> $BASH_ENV

source $BASH_ENV