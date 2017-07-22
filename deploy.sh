#!/bin/sh

if ! git config remote.all.url > /dev/null; then
  git remote add all git@bitbucket.org:djagya/lara-blog.git
  git remote set-url --add all ssh://root@146.185.131.218/var/www/git/lara-blog.git
fi

sleep 3

git add .
git commit -m "lara changes"
git push all --all

