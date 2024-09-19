#!/bin/bash

if [ $# -eq 2 ];
then
    SOURCE_COMMIT_ID=$1
    TARGET_COMMIT_ID=$2
else
    echo "Please provide Commit ID's as Input"
    exit 1
fi

npm install @salesforce/cli -g
pip install xq
pip install yq

echo y | sf plugins install sfdx-git-delta;

sfdx sgd:source:delta --to $SOURCE_COMMIT_ID --from $TARGET_COMMIT_ID --output . -a 60 --ignore .forceignore
