#!/bin/bash

dotdir=$(dirname $(readlink -f $BASH_SOURCE))
deploydir=~

# deploy emacs stuff
ln -s $dotdir/emacs/emacs.d $deploydir
ln -s $dotdir/emacs/.emacs $deploydir

# deploy matlab startup script
ln -s $dotdir/matlab/startup.m $deploydir

# deploy git stuff
ln -s $dotdir/git/.gitconfig $deploydir
