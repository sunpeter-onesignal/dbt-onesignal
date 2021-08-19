#!/usr/bin/env bash

git clone $REMOTE_REPO
cd $REPO_DIR
mkdir ~/.dbt
mv ../profiles.yml ~/.dbt/profiles.yml

dbt rpc

while [ True ]
do
    sleep 3600
    if [ `git rev-parse --short HEAD` != `git rev-parse --short origin/main` ]; then
        git pull
    fi
done