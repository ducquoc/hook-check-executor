#!/bin/sh

BASEDIR=`dirname "$0"`
SCRIPT_NAME=`basename "$0"`

if [ -z "$1" ]; then 
  echo USAGE: 
  echo $0 REMOTE_UPSTREAM_URL [LOCAL_REPO_DIR]
  echo Examples: 
  echo "$0 git@github.com:webflow/leadership.git ../leadership"
  echo "cd ../leadership && ../hook-check-executor/$SCRIPT_NAME git@github.com:webflow/leadership.git && cd - "
  exit
else
  UPSTREAM_URL="$1"
  BASEDIR="$2"
fi

BASEDIR=`(cd "$BASEDIR"; pwd)`
#echo Absolute basedir: $BASEDIR

cd "$BASEDIR"
GIT_REMOTE_UPSTREAM=$(git remote -v | grep upstream | grep -v push | awk '{print $2}')
if [ ! -z "$GIT_REMOTE_UPSTREAM" ]; then
  echo -e " \n Will use existing upstream: $GIT_REMOTE_UPSTREAM \n "
  #git remote rm upstream
  UPSTREAM_URL=$GIT_REMOTE_UPSTREAM
else 
  echo -e " \n Will add upstream (new ref): $UPSTREAM_URL \n "
  git remote add upstream $UPSTREAM_URL
fi

#git pull upstream
git fetch upstream
git checkout master && git merge upstream/master

GIT_STATUS_DIRTY=$(git status --porcelain)
if [ ! -z "$GIT_STATUS_DIRTY" ]; then
  echo -e " \n What the fork? Italian Malta joke?! \n "
  LOCAL_DATE=`date`
  git add . && git commit -a -m "update origin after merge upstream $LOCAL_DATE "
  git push origin master
else
  echo -e " \n Nothing new. I want a fork on the table. \n "
fi

cd -

