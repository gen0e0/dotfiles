#!/bin/sh
cd `dirname $0`/..
dir=`pwd`

for link in `find $HOME -maxdepth 1 -type l -name '.*'`; do
  echo "Unlink $link"

  if [ `readlink $link| grep $dir` ] ; then
    unlink $link
  fi
done
