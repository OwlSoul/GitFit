#!/bin/bash

echo -e "Switching to the master (or main) branch"
git checkout master || git checkout main

echo -e "\nDeleting current active local branches:"
# List current branches, without asterisk
branches=$(git for-each-ref --format='%(refname:short)' refs/heads/)


for branch in $branches; do
	if [ "$branch" == "master" ];then
		continue
	fi
	if [ "$branch" == "main" ];then
		continue
	fi
	git branch -D "$branch"
	echo "$branch : DELETED"
done
echo "DONE"

# Pulling the latest version of the master
echo -e "\nPulling current master/main branch"
git pull origin master || git pull origin main

echo -e "\n[COMPLETED] Your git is fit!"
