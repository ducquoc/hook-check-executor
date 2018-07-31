#!/bin/sh

BASEDIR=`dirname "$0"`
SCRIPT_NAME=`basename "$0"`

if [ -z "$1" ]; then 
  echo USAGE: 
  echo $0 REMOTE_UPSTREAM_URL [LOCAL_REPO_DIR]
  echo Examples: 
  echo "cd ../../bitbucket/jutil-dq && ../../github/hook-check-executor/$SCRIPT_NAME git@github.com:ducquoc/jutil-dq.git && cd - "
  exit
else
  UPSTREAM_URL="$1"
  BASEDIR="$2"
fi

BASEDIR=`(cd "$BASEDIR"; pwd)`
#echo Absolute basedir: $BASEDIR

REMOTE_REF="up_gh"

cd "$BASEDIR"
GIT_REMOTE_UPSTREAM=$(git remote -v | grep $REMOTE_REF | grep -v push | awk '{print $2}')
if [ ! -z "$GIT_REMOTE_UPSTREAM" ]; then
  echo -e " \n _DEBUG_ Will use existing $REMOTE_REF: $GIT_REMOTE_UPSTREAM \n "
  #git remote rm $REMOTE_REF
  UPSTREAM_URL=$GIT_REMOTE_UPSTREAM
else 
  echo -e " \n _DEBUG_ Will add $REMOTE_REF (new ref): $UPSTREAM_URL \n "
  git remote add $REMOTE_REF $UPSTREAM_URL
fi

#git pull $REMOTE_REF
git fetch $REMOTE_REF
git checkout master && git merge $REMOTE_REF/master

GIT_STATUS_DIRTY=$(git status --porcelain)
GIT_STATUS_AHEAD=$(git status | grep "ahead of")
if [ ! -z "$GIT_STATUS_DIRTY" ] || [ ! -z "$GIT_STATUS_AHEAD" ]; then
  echo -e " \n _DEBUG_ What the fork? Italian Malta joke?! \n "
  LOCAL_DATE=`date`
  #echo Preparing add commit push $LOCAL_DATE
  git add . && git commit -a -m "update origin after merge $REMOTE_REF $LOCAL_DATE "
  git push origin master
else
  echo -e " \n _DEBUG_ Nothing new. I want a fork on the table. \n "
fi

cd -

