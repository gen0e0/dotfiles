#!/bin/sh

cd `dirname $0`/../dotfiles
dir=`pwd`
for file in `\find $dir -maxdepth 1 -name '.*'`; do
  echo "Symlink $file to $HOME"
  ln -si $file $HOME/`basename $file`
done

cd ../support
echo "Copy .env to $HOME"
cp -i env.example $HOME/.env
