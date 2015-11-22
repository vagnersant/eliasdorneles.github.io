#!/bin/bash

set -e

eval $(ssh-agent) && chmod 600 deploy_key.pem && ssh-add deploy_key.pem

git remote add deploy git@github.com:eliasdorneles/eliasdorneles.github.io.git || echo "Remote already exists"
git remote -v

make clean compile

ghp-import -m "Update site" output

git push deploy gh-pages:master --force
