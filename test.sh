#!/bin/bash

git config --global user.name "n0bisuke"
git config --global user.email "aki.bdash@gmail.com"

git remote set-url origin https://n0bisuke:${GITHUB_TOKEN}@github.com/n0bisuke/github_actions.git

git checkout -b master
git branch -a

git log -1
last_commit_message="$(git log -1 | tail -1)"
echo $last_commit_message

if [ -z "$(echo $last_commit_message | grep updater)" ]; then
    git log -1 | head -1 > last_commit.txt
    cat last_commit.txt
    git add last_commit.txt
    git commit -m '[updater] update last commit'
    git push origin HEAD
else
    echo "nothing updated"
fi
