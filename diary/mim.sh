#! /bin/sh

# merge into master

BR=`git branch --show-current`

git add --all
git commit -m "no message"
git checkout master
git merge -m "Merge branch '$BR'" --no-ff $BR
git checkout $BR
git merge --ff master
git push --all
