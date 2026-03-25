#!/bin/sh

cd `dirname $0`/../dotfiles
dir=`pwd`
for file in `\find $dir -maxdepth 1 -name '.*' -not -name '.claude'`; do
  echo "Symlink $file to $HOME"
  ln -si $file $HOME/`basename $file`
done

# .claude: symlink individual files and directories
mkdir -p $HOME/.claude
for file in CLAUDE.md settings.json keybindings.json; do
  echo "Symlink .claude/$file to $HOME/.claude/$file"
  ln -si $dir/.claude/$file $HOME/.claude/$file
done
for subdir in commands; do
  echo "Symlink .claude/$subdir/ to $HOME/.claude/$subdir"
  ln -si $dir/.claude/$subdir $HOME/.claude/$subdir
done
