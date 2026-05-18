#!/bin/sh

cd `dirname $0`/../dotfiles
dir=`pwd`
for file in `\find $dir -maxdepth 1 -name '.*' -not -name '.claude'`; do
  echo "Symlink $file to $HOME"
  ln -sni $file $HOME/`basename $file`
done

# .claude: symlink individual files and directories
mkdir -p $HOME/.claude
for file in CLAUDE.md settings.json keybindings.json; do
  echo "Symlink .claude/$file to $HOME/.claude/$file"
  ln -sni $dir/.claude/$file $HOME/.claude/$file
done
for subdir in commands; do
  echo "Symlink .claude/$subdir/ to $HOME/.claude/$subdir"
  ln -sni $dir/.claude/$subdir $HOME/.claude/$subdir
done

# マシン固有の環境変数: support/env.example を $HOME/.env にコピー（既存は上書きしない）
env_example="$dir/../support/env.example"
if [ ! -e "$HOME/.env" ]; then
  echo "Copy support/env.example to $HOME/.env"
  cp "$env_example" "$HOME/.env"
else
  echo "Skip $HOME/.env (already exists)"
fi
