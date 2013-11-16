#!/bin/bash

target_path="/Users/abeyuya/.vim"

# gitの場合
cd ${target_path}
echo `pwd`
git_status_result=`git diff --exit-code`

if [ "${git_status_result}" == "" ]; then
  # need_rebase=true
  echo "clean!"
  rebase_result=`git rebase master`
else
  # need_rebase=false
  rebase_result="need stash!"
fi

echo "${rebase_result}"
