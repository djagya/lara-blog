#!/bin/sh

cd "$(dirname "$0")"

if ! git config remote.all.url > /dev/null; then
  git remote add all git@bitbucket.org:djagya/lara-blog.git
  git remote set-url --add all ssh://root@146.185.131.218/var/www/git/lara-blog.git
fi


git add .
git commit -m "lara changes"
git fetch origin master
git merge --no-edit -s recursive -X theirs origin/master
git push -f all master

echo -e "\033[0;31mЯ люблю тебя, Лара <3"

sleep 3

osascript -e 'tell application "Terminal" to quit' &
exit 0