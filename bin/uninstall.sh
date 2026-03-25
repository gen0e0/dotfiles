#!/bin/sh
cd `dirname $0`/..
dir=`pwd`

for link in `find $HOME -maxdepth 1 -type l -name '.*'`; do
  echo "Unlink $link"

  if [ `readlink $link| grep $dir` ] ; then
    unlink $link
  fi
done

# .claude: unlink individual files and directories
for link in $HOME/.claude/CLAUDE.md $HOME/.claude/settings.json $HOME/.claude/keybindings.json $HOME/.claude/commands; do
  if [ -L "$link" ] && readlink "$link" | grep -q "$dir"; then
    echo "Unlink $link"
    unlink "$link"
  fi
done
