#!/bin/bash

STOW=xstow
REALPATH=realpath
type $STOW >/dev/null 2>&1 || \
    { echo >&2 "requires $STOW but it's not installed. Aborting."; \
      exit 1;
    }
type $REALPATH >/dev/null 2>&1 || \
    { echo >&2 "requires $realpath but it's not installed. Aborting."; \
      exit 1;
    }

dotdir=$(dirname $(readlink -f $BASH_SOURCE))
deploydir=$(realpath $HOME)

deploycmd="$STOW -R --dir $dotdir --target $deploydir"

type $STOW >/dev/null 2>&1 || \
    { echo >&2 "requires $STOW but it's not installed. Aborting."; \
      exit 1;
    }

for d in $(ls $dotdir); do
    if [ -d $d ]; then
	echo $deploycmd $d
	$deploycmd $d 2>&1 
    fi
done
