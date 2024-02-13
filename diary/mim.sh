#! /bin/sh

# merge into master

BR=`git branch --show-current`

git add --all
git commit -m "Commit the diary from '$BR'"
git checkout main
git pull
git merge -m "Merge the diary branch '$BR'" --no-ff $BR
git push
git pull --all
git checkout $BR
git merge --ff main
git push
