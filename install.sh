#!/bin/sh
dir=`pwd`
ln -sf $dir/.* $HOME/

rm $HOME/.gitignore
rm $HOME/.git
