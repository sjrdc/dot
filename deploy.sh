#!/bin/bash

dotdir=$(dirname $(readlink -f $BASH_SOURCE))

# deploy emacs stuff
ln -s $dotdir/emacs/emacs.d ~
ln -s $dotdir/emacs/.emacs ~

# deploy matlab startup script
ln -s $dotdir/matlab/startup.m

