#! /bin/sh

# merge into master

BR=`git branch --show-current`

git add --all
git commit -m "commit from '$BR'"
git checkout main
git merge -m "Merge branch '$BR'" --no-ff $BR
git push
git pull --all
git checkout $BR
git merge --ff main
git push
