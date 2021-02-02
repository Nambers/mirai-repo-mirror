#!/usr/bin/env bash

git config --local user.name "RepoSync"
git config --local user.email "RepoSync@localhost"

git config --local core.sshCommand "ssh -i ./.script/id_rsa -F /dev/null"

target=$1
source=$2

echo Syncing repos...

git pull "$source" master
git pull "$target" master

echo Updating repos...

git push "$source" master
git push "$target" master

git config --local --unset core.sshCommand
git config --local --unset user.name
git config --local --unset user.email
