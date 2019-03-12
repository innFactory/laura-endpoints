#!/bin/bash

# in circle ci $BASH_ENV is automatically set
# for local usage use the local script

echo 'export VERSION=$CIRCLE_SHA1 ' >> $BASH_ENV
echo 'export BRANCH=$CIRCLE_BRANCH ' >> $BASH_ENV

if [ $CIRCLE_BRANCH = master ]
then

echo 'export CLOUD_ENDPOINT_CMS="https://cms.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export CLOUD_ENDPOINT_DIALOGFLOW="https://dialogflow.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export CLOUD_ENDPOINT_PDF="https://pdf.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export CLOUD_ENDPOINT_CRAWLER="https://crawler.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export UI_ENDPOINT_APP="https://baufinanzieren-rosenheim.de/" ' >> $BASH_ENV
echo 'export UI_ENDPOINT_MANAGEMENT="https://management.laura-ai.de" ' >> $BASH_ENV

elif [ $CIRCLE_BRANCH = develop ]
then

echo 'export CLOUD_ENDPOINT_CMS="https://cms.staging.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export CLOUD_ENDPOINT_DIALOGFLOW="https://dialogflow.staging.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export CLOUD_ENDPOINT_PDF="https://pdf.staging.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export CLOUD_ENDPOINT_CRAWLER="https://crawler.staging.cloud.laura-ai.de/" ' >> $BASH_ENV
echo 'export UI_ENDPOINT_APP="https://staging.laura-ai.de/" ' >> $BASH_ENV
echo 'export UI_ENDPOINT_MANAGEMENT="https://management.staging.laura-ai.de" ' >> $BASH_ENV

fi

source $BASH_ENV