#!/bin/bash

# run with: . ./configure_endpoints_local.sh -b develop -v 1.0
# or with: . ./configure_endpoints_local.sh -b master -v 1.0
if [[ $# -eq 0 ]] ; then
    echo 'usage: . configure_endpoints_local.sh [parameters]'
    echo 'paramters:'
    echo '-b --branch: Which branch should i simulate'
    echo '-v --version: which version should i set'
    
    echo 'example master: . ./configure_endpoints_local.sh -b master -v 1.0'
    echo 'example master: . ./configure_endpoints_local.sh -b develop -v 1.0'
    echo 'THE . AT THE BEGINNING IS NECESSARY TO EXPORT THE VARIABLES TO YOUR CURRENT SHELL PROCESS!'
else

while [[ "$#" > 0 ]]; do case $1 in
  -b|--branch) branch="$2"; shift;;
  -v|--version) version="$2"; shift;;
esac; shift; done

export BASH_ENV=./bash_env.sh
touch $BASH_ENV
#echo "#!/bin/bash" >> $BASH_ENV

export CIRCLE_BRANCH=$branch
export CIRCLE_SHA1=$version

./configure_endpoints.sh

. $BASH_ENV
rm $BASH_ENV
fi