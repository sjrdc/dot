#!/bin/bash

dotdir=$(dirname $(readlink -f $BASH_SOURCE))
deploydir=~
STOW=stow
deploycmd="$STOW --dir $dotdir --target $deploydir"

type $STOW >/dev/null 2>&1 || \
    { echo >&2 "requires $STOW but it's not installed. Aborting."; \
      exit 1;
    }

for d in $(ls $dotdir); do
    if [ -d $d ]; then
	$deploycmd $d 2>&1 \
	    | grep --invert-match precedence
    fi
done
